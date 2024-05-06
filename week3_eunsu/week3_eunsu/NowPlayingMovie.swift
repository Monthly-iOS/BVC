//
//  NowPlayingMovie.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/6/24.
//

import Foundation

struct NowPlayingMovie: Decodable {
    let dates: Dates
    let page: Int
    let results: [MovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Decodable {
    let maximum, minimum: String
}
