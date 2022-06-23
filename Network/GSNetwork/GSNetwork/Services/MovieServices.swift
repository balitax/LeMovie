//
//  MovieServices.swift
//  GSNetwork
//
//  Created by Agus cahyono on 17/06/22.
//

import Foundation

protocol MovieServices {
    func getMovies(from endpoint: MovieListEndpoint) async throws -> MovieResponse
    func searchMovie(for query: String) async throws -> MovieResponse
    func getMovieTrailer(for movieId: Int) async throws -> MovieVideoResponse
}

public enum MovieListEndpoint: String, CaseIterable, Identifiable {
    public var id: String { rawValue }
    
    case nowPlaying = "now_playing"
    case upcoming
    case popular
    case topRated = "top_rated"
    
    public var description: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

public enum MovieError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    public var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to get data from API"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    public var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}
