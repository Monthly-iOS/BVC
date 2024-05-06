//
//  tmdbAPI.swift
//  week3_eunsu
//
//  Created by Eunsu JEONG on 5/6/24.
//

import UIKit

class tmdbAPI {
    static let shared = tmdbAPI()
    private let imageURL = "https://image.tmdb.org/t/p/w300"
    let popularMovieURL = "https://api.themoviedb.org/3/movie/popular"
    let topRatedMovieURL = "https://api.themoviedb.org/3/movie/top_rated"
    let UpcomingMovieURL = "https://api.themoviedb.org/3/movie/upcoming"
    
    private init() { }
    
    func requestData(url: URL, queryItems: [URLQueryItem]) async throws -> Data {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNjkyN2NlMTNiYjVlM2YzZDQzNjliZDVhYjM0OTFjZSIsInN1YiI6IjY2MzhjZjQyOTU5MGUzMDEyNmJkNmUzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.b4Jk5IoAiAdktNnDiWcYmTTV_efG_eJH7HaMp8P2bLM"
        ]
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        return data
    }
    
    func requestTrendingMoviesOfToday() async throws -> [NetflixItem] {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day") else {
            return [NetflixItem]()
        }
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "ko"),
        ]
        
        let data = try await requestData(url: url, queryItems: queryItems)
        let decodedData = try JSONDecoder().decode(Movie.self, from: data)
        let results = decodedData.results.map { (decodedData) -> NetflixItem in
            NetflixItem(title: decodedData.title, image: imageURL + decodedData.posterPath)
        }

        return results
    }
    
    func requestTrendingTVsOfToday() async throws -> [NetflixItem] {
        guard let url = URL(string: "https://api.themoviedb.org/3/trending/tv/day") else {
            return [NetflixItem]()
        }
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "ko"),
        ]
        let data = try await requestData(url: url, queryItems: queryItems)
        let decodedData = try JSONDecoder().decode(TrendingTV.self, from: data)
        let results = decodedData.results.map { (decodedData) -> NetflixItem in
            NetflixItem(title: decodedData.name, image: imageURL + decodedData.posterPath)
        }
        
        return results
    }
    
    func requestNowPlayingMovies() async throws -> [NetflixItem] {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing") else { 
            return [NetflixItem]()
        }
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "ko"),
            URLQueryItem(name: "page", value: "1"),
        ]
        let data = try await requestData(url: url, queryItems: queryItems)
        let decodedData = try JSONDecoder().decode(NowPlayingMovie.self, from: data)
        let results = decodedData.results.map { (decodedData) -> NetflixItem in
            NetflixItem(title: decodedData.title, image: imageURL + decodedData.posterPath)
        }
        
        return results
    }
    
    func requestMovie(url: String) async throws -> [NetflixItem] {
        guard let url = URL(string: url) else {
            return [NetflixItem]()
        }
        
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "ko"),
        ]
        
        let data = try await requestData(url: url, queryItems: queryItems)
        let decodedData = try JSONDecoder().decode(Movie.self, from: data)
        let results = decodedData.results.map { (decodedData) -> NetflixItem in
            NetflixItem(title: decodedData.title, image: imageURL + decodedData.posterPath)
        }

        return results
    }
    
    func fetchImage(url: String) async throws -> UIImage {
        let url = URL(string: url)
        
        guard let url = url else {
            throw NSError(domain: "url error", code: 888)
        }
        
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode, (200...299).contains(statusCode) else {
            throw NSError(domain: "fetch error", code: 1004)
        }
        
        guard let image = UIImage(data: data) else {
            throw NSError(domain: "image coverting error", code: 999)
        }

        return image
    }
}
