//
//  RefreshTokenResponse.swift
//  week5_eunsu
//
//  Created by Eunsu JEONG on 6/19/24.
//

import Foundation

struct RefreshTokenResponse: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int
    let refreshToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
    }
}
