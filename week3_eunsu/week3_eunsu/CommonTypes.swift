//
//  CommonTypes.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/6/24.
//

import Foundation

enum MediaType: String, Codable {
    case tv = "tv"
}

enum OriginCountry: String, Codable {
    case gb = "GB"
    case jp = "JP"
    case kr = "KR"
    case us = "US"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case ja = "ja"
    case ko = "ko"
    case es = "es"
    case fr = "fr"
}

