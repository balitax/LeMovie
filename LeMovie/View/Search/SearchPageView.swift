//
//  SearchPageView.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI

struct SearchPageView: View {
    
    @StateObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                MovieGridListView(movies: searchViewModel.movies)
            }
            .overlay(searchViewModel.overlayView)
            .navigationTitle("Search Movie")
            .searchable(text: $searchViewModel.searchMovie, prompt: Text("Search Movie"))
            .onChange(of: searchViewModel.searchMovie) { _ in
                search()
            }
        }
        
    }
    
    private func search() {
        let searchQuery = searchViewModel.searchMovie.trimmingCharacters(in: .whitespacesAndNewlines)
        if !searchQuery.isEmpty {
            Task {
                await searchViewModel.searchMovie(for: searchQuery)
            }
        }
    }
    
}

struct SearchPageView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPageView()
    }
}
