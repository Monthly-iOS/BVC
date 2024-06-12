//
//  AuthManager.swift
//  week5_eunsu
//
//  Created by Eunsu JEONG on 5/22/24.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let clientID = Bundle.main.object(forInfoDictionaryKey: "SPOTIFY_CLIENT_ID") as! String
        static let privateID = Bundle.main.object(forInfoDictionaryKey: "SPOTIFY_PRIVATE_ID") as! String
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
        return false
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpireationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
