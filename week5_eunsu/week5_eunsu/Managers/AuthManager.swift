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
