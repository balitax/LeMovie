//
//  DetailViewModel.swift
//  LeMovie
//
//  Created by Agus cahyono on 21/06/22.
//

import SwiftUI
import GSNetwork

@MainActor
class DetailViewModel: ObservableObject {
    
    @Published var trailerPhase  = DataFetchPhase<[VideoResult]>.empty
    
    var trailers: [VideoResult] {
        if case let .success(videos) = trailerPhase {
            return videos.filter { $0.youtubeURL != nil }
        } else {
            return []
        }
    }
    
    func loadVideoTrailer(for idMovie: Int) async {
        if Task.isCancelled { return }
        
        do {
            let trailer = try await MovieAPIServices.shared.getMovieTrailer(for: idMovie)
            if Task.isCancelled { return }
            if !trailer.results.isEmpty {
                trailerPhase = .success(trailer.results)
            } else {
                trailerPhase = .empty
            }
        } catch {
            if Task.isCancelled { return }
            trailerPhase = .failure(.serializationError)
        }
    }
    
}
