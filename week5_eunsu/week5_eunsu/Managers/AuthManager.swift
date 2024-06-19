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
    
    static let cacheTokens: [UserDefaultKeys] = [accessToken, refreshToken, expirationDate]
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
        let scope = "user-read-private user-read-email"
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
    
    private var shouldRefreshToken: Bool {
        return false
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
        UserDefaults.standard.setValue(result.accessToken, forKey: "accessToken")
        UserDefaults.standard.setValue(result.refreshToken, forKey: "refreshToken")
        UserDefaults.standard.setValue(Date().addingTimeInterval(TimeInterval(result.expiresIn)), forKey: "expirationDate")
    }
}
