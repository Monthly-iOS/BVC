//
//  AuthManager.swift
//  week5_eunsu
//
//  Created by Eunsu JEONG on 5/22/24.
//

import Foundation
import Security

enum UserDefaultKeys: String, CaseIterable {
    case accessToken
    case refreshToken
    case expirationDate
}

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = Bundle.main.object(forInfoDictionaryKey: "SPOTIFY_CLIENT_ID") as! String
        static let clientSecret = Bundle.main.object(forInfoDictionaryKey: "SPOTIFY_PRIVATE_ID") as! String
        static let tokenAPIURL = "https://accounts.spotify.com/api/token"
        static let redirectURI = "http://localhost:8888/callback"
    }
    
    private init() { }
    
    public var signInURL: URL? {
        let baseUrl = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private user-read-email playlist-modify-public playlist-read-private playlist-modify-private user-follow-read user-library-modify user-library-read"
        let redirectURI = Constants.redirectURI
        let state = generateRandomString(length: 16)
        let url = "\(baseUrl)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(redirectURI)&state=\(state)&show_dialog=TRUE"
        
        return URL(string: url)
    }
    
    func generateRandomString(length: Int) -> String {
        let characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        var randomString = ""
        var bytes = [UInt8](repeating: 0, count: length)
        
        let result = SecRandomCopyBytes(kSecRandomDefault, length, &bytes)
        if result == errSecSuccess {
            for byte in bytes {
                randomString.append(characters.randomElement()!)
            }
        } else {
            fatalError("Unable to generate random bytes")
        }
        
        return randomString
    }
    
    var isSigendIn: Bool {
        return accessToken != nil
    }
    
    var accessToken: String? {
        let userDefaultsKey = UserDefaultKeys.accessToken
        return UserDefaults.standard.string(forKey: userDefaultsKey.rawValue)
    }
    
    private var refreshToken: String? {
        let userDefaultsKey = UserDefaultKeys.refreshToken
        return UserDefaults.standard.string(forKey: userDefaultsKey.rawValue)
    }
    
    private var tokenExpireationDate: Date? {
        let userDefaultsKey = UserDefaultKeys.expirationDate
        return UserDefaults.standard.object(forKey: userDefaultsKey.rawValue) as? Date
    }
    
    ///token expire 기한이 5분 이하로 남았는지 확인
    private var shouldRefreshToken: Bool {
        guard let expirationDate = tokenExpireationDate else {
            print("No expiration date")
            return false
        }
        let currentDate = Date()
        let fiveMinutes: TimeInterval = 300
        
        return currentDate.addingTimeInterval(fiveMinutes) >= expirationDate
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "accounts.spotify.com"
        components.path = "/api/token"
        components.queryItems = [
            URLQueryItem(name: "grant_type", value: "authorization_code"),
            URLQueryItem(name: "code", value: code),
            URLQueryItem(name: "redirect_uri", value: Constants.redirectURI)
        ]
        
        guard let urlWithComponent = components.url else {
            print("fail urlWithComponent")
            return
        }
        var request = URLRequest(url: urlWithComponent)
        
        request.httpMethod = "POST"
        let encodedCredentials = "\(Constants.clientID):\(Constants.clientSecret)".data(using: .utf8)!.base64EncodedString()
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("Basic \(encodedCredentials)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                completion(false)
                print("Error: \(error?.localizedDescription ?? "Undefined Error")")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Failed to optialnal binding response")
                return
            }
            
            guard response.statusCode == 200 else {
                print("HTTP Error: \(response.statusCode)")
                return
            }
            
            do {
                let tokenResult = try JSONDecoder().decode(AuthTokenResponse.self, from: data)
                self?.cacheToken(result: tokenResult)
                completion(true)
            }
            catch {
                print("Error decoding response: \(error.localizedDescription)")
                completion(false)
            }
        }
        
        task.resume()
    }
    
    private func cacheToken(result: AuthTokenResponse) {
        UserDefaults.standard.setValue(result.accessToken, forKey: UserDefaultKeys.accessToken.rawValue)
        UserDefaults.standard.setValue(result.refreshToken, forKey: UserDefaultKeys.refreshToken.rawValue)
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expiresIn)), forKey: UserDefaultKeys.expirationDate.rawValue)
    }
    
    private func cacheRefreshToken(result: RefreshTokenResponse) {
        UserDefaults.standard.setValue(result.accessToken, forKey: UserDefaultKeys.accessToken.rawValue)
        if let refreshToken = result.refreshToken {
            UserDefaults.standard.setValue(result.refreshToken, forKey: UserDefaultKeys.refreshToken.rawValue)
        }
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expiresIn)), forKey: UserDefaultKeys.expirationDate.rawValue)
    }
    
    public func refreshAccessToken(completion: @escaping (Bool) -> Void) {
        guard shouldRefreshToken else {
            completion(true)
            return
        }
        
        guard let refreshToken = self.refreshToken else {
            print("refreshToken binding failure")
            return
        }
        
        //Refresh Token
        guard let url = URL(string: Constants.tokenAPIURL) else {
            print("url binding failure")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let bodyComponents = [
            "grant_type": "refresh_token",
            "refresh_token": refreshToken,
            "client_id": Constants.clientID,
            "client_secret": Constants.clientSecret
        ]
        
        request.httpBody = bodyComponents
            .map { "\($0.key)=\($0.value)" }
            .joined(separator: "&")
            .data(using: .utf8)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                completion(false)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("HTTP Error: \((response as? HTTPURLResponse)?.statusCode ?? 0)")
                completion(false)
                return
            }
            
            do {
                let refreshTokenResponse = try JSONDecoder().decode(RefreshTokenResponse.self, from: data)
                self.cacheRefreshToken(result: refreshTokenResponse)
                completion(true)
                print("Access Token: \(refreshTokenResponse.accessToken)")
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(false)
            }
        }
        
        task.resume()
    }
}
