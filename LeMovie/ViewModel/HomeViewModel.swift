//
//  HomeViewModel.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI
import GSNetwork

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var nowplayingPhase  = DataFetchPhase<[MovieDB]>.empty
    @Published var upcomingPhase    = DataFetchPhase<[MovieDB]>.empty
    @Published var moviePhase       = DataFetchPhase<[MovieDB]>.empty
    
    var nowPlaying: [MovieDB] {
        if case let .success(movies) = nowplayingPhase {
            return movies
        } else {
            return []
        }
    }
    
    var upcoming: [MovieDB] {
        if case let .success(movies) = upcomingPhase {
            return movies
        } else {
            return []
        }
    }
    
    var movies: [MovieDB] {
        if case let .success(movies) = moviePhase {
            return movies
        } else {
            return []
        }
    }
    
    func loadMovie(for endPoint: MovieListEndpoint) async {
        if Task.isCancelled { return }
        
        switch endPoint {
        case .nowPlaying: nowplayingPhase = .empty
        case .upcoming: upcomingPhase = .empty
        default: break
        }
        
        do {
            let movies = try await MovieAPIServices.shared.getMovies(from: endPoint)
            if Task.isCancelled { return }
            
            switch endPoint {
            case .nowPlaying:
                nowplayingPhase = .success(movies.results)
            case .upcoming:
                upcomingPhase = .success(movies.results)
            default:
                moviePhase = .success(movies.results)
            }
            
        } catch {
            if Task.isCancelled { return }
            switch endPoint {
            case .nowPlaying: nowplayingPhase = .failure(.serializationError)
            case .upcoming: upcomingPhase = .failure(.serializationError)
            default: moviePhase = .failure(.serializationError)
            }
        }
    }
    
    @ViewBuilder
    var overlayUpcomingView: some View {
        switch upcomingPhase {
        case .empty: ProgressView()
        case .success(let movies) where movies.isEmpty:
            EmptyPlaceholderView(text: "No Movies", image: Image(systemName: "newspaper"))
        case .failure(let error):
            RetryView(text: error.localizedDescription) {
                Task {
                    await self.loadMovie(for:.upcoming)
                }
            }
        default: EmptyView()
        }
    }
    
    @ViewBuilder
    var overlayNowPlayingView: some View {
        switch nowplayingPhase {
        case .empty: ProgressView()
        case .success(let movies) where movies.isEmpty:
            EmptyPlaceholderView(text: "No Movies", image: Image(systemName: "newspaper"))
        case .failure(let error):
            RetryView(text: error.localizedDescription) {
                Task {
                    await self.loadMovie(for: .nowPlaying)
                }
            }
        default: EmptyView()
        }
    }
    
    @Published var sorts = MovieListEndpoint.allCases.filter { $0 != .upcoming && $0 != .nowPlaying }
    
    @Published var previews = [MovieDB]()
    
}
