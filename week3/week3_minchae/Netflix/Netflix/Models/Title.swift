//
//  Title.swift
//  Netflix
//
//  Created by 황민채 on 5/12/24.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let name: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let first_air_date: String?
    let vote_average: Double
}
