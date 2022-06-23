//
//  SearchViewModel.swift
//  LeMovie
//
//  Created by Agus cahyono on 21/06/22.
//

import SwiftUI
import GSNetwork
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var searchMovie: String = ""
    @Published var searchPhase  = DataFetchPhase<[MovieDB]>.empty
    
    var movies: [MovieDB] {
        if case let .success(videos) = searchPhase {
            return videos
        } else {
            return []
        }
    }
    
    func searchMovie(for query: String) async {
        if Task.isCancelled { return }
        searchPhase = .empty
        do {
            let search = try await MovieAPIServices.shared.searchMovie(for: query)
            if Task.isCancelled { return }
            searchPhase = search.results.isEmpty ? .success([]) : .success(search.results)
        } catch {
            if Task.isCancelled { return }
            searchPhase = .failure(.serializationError)
        }
    }
    
    @ViewBuilder
    var overlayView: some View {
        switch searchPhase {
        case .empty:
            if !searchMovie.isEmpty {
                ProgressView()
            } else {
                EmptyPlaceholderView(text: "Type your query news", image: Image(systemName: "magnifyingglass"))
            }
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No search result found", image: Image(systemName: "magnifyingglass"))
        case .failure(let error):
            RetryView(text: error.localizedDescription) {
                Task {
                    await self.searchMovie(for: self.searchMovie)
                }
            }
        default:
            EmptyView()
        }
    }
    
}
