//
//  MovieAPIServices.swift
//  GSNetwork
//
//  Created by Agus cahyono on 17/06/22.
//

import Foundation

public class MovieAPIServices: MovieServices {
    
    public static let shared = MovieAPIServices()
    private init() {}
    
    private let apiKey = "86326ce41dbf85964b57befc0d49840e"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        return jsonDecoder
    }()
    
    public func getMovies(from endpoint: MovieListEndpoint) async throws -> MovieResponse {
        guard let url = URL(string: "\(baseAPIURL)/movie/\(endpoint.rawValue)") else {
            throw generateError(error: .invalidEndpoint)
        }
        return try await fetchMovieFromAPI(from: url)
    }
    
    public func searchMovie(for query: String) async throws -> MovieResponse {
        guard let url = URL(string: "\(baseAPIURL)/search/movie") else {
            throw generateError(error: .invalidEndpoint)
        }
        
        return try await fetchMovieFromAPI(from: url, parameters: [
            "language": "en-US",
            "include_adult": "false",
            "region": "US",
            "query": query
        ])
    }
    
    public func getMovieTrailer(for movieId: Int) async throws -> MovieVideoResponse {
        guard let url = URL(string: "\(baseAPIURL)/movie/\(movieId)/videos") else {
            throw generateError(error: .invalidEndpoint)
        }
        return try await fetchMovieFromAPI(from: url)
    }
    
    private func generateError(error: MovieError) -> MovieError {
        error
    }
    
    private func fetchMovieFromAPI<D: Decodable>(from url: URL, parameters: [String: String]? = nil) async throws -> D {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            throw generateError(error: .invalidEndpoint)
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        if let parameters = parameters {
            queryItems.append(contentsOf: parameters.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            throw generateError(error: .invalidEndpoint)
        }
        
        let (data, response) = try await urlSession.data(from: finalURL)
        
        guard let resposes = response as? HTTPURLResponse else {
            throw generateError(error: .invalidResponse)
        }
        
        switch resposes.statusCode {
        case (200...299), (40...499):
            let apiResponse = try jsonDecoder.decode(D.self, from: data)
            return apiResponse
        default:
            throw generateError(error: .apiError)
        }
        
    }
    
}
