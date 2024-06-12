//
//  AuthTokenResponse.swift
//  week5_eunsu
//
//  Created by Eunsu JEONG on 6/12/24.
//

import Foundation

struct AuthTokenResponse: Decodable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int
    let refreshToken: String
    let scope: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case refreshToken = "refresh_token"
        case scope
    }
}
