//
//  AuthManager.swift
//  week5_eunsu
//
//  Created by Eunsu JEONG on 5/22/24.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() { }
    
    public var signInURL: URL? {
        let baseUrl = "https://accounts.spotify.com/authorize"
        let scope = "user-read-private"
        let redirectURI = "https://www.iosacademy.io"
        let url = "\(baseUrl)?response_type=code&client_id=\(Constants.clientID)&scope=\(scope)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        
        return URL(string: url)
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
