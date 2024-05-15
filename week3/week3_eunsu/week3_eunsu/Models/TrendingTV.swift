//
//  TrendingTV.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/6/24.
//

import Foundation

struct TrendingTV: Decodable {
    let page: Int
    let results: [TrendingTVResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - TrendingTVResult
struct TrendingTVResult: Decodable {
    let backdropPath: String
    let id: Int
    let originalName, overview, posterPath: String
    let mediaType: MediaType
    let adult: Bool
    let name: String
    let originalLanguage: OriginalLanguage
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [OriginCountry]

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult, name
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
    }
}
