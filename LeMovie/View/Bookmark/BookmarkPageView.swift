//
//  BookmarkPageView.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI
import GSNetwork

struct BookmarkPageView: View {
    
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                MovieGridListView(movies: movies)
            }
            .overlay(overlayView(movies.isEmpty))
            .navigationBarTitle("Bookmark")
            .searchable(text: $bookmarkViewModel.searchBookmark, prompt: Text("Searh Bookmark"))
        }
    }
    
    public var movies: [MovieDB] {
        if bookmarkViewModel.searchBookmark.isEmpty {
            return bookmarkViewModel.bookmarks
        } else {
            return bookmarkViewModel.bookmarks.filter {
                $0.originalTitle?.lowercased().contains(bookmarkViewModel.searchBookmark.lowercased()) ?? false
            }
        }
    }
    
    @ViewBuilder
    func overlayView(_ isEmpty: Bool) -> some View {
        if isEmpty {
            EmptyPlaceholderView(text: "No Bookmarked Movie", image: Image(systemName: "bookmark"))
        }
    }
}

struct BookmarkPageView_Previews: PreviewProvider {
    @StateObject static var bookmarkVM = BookmarkViewModel.shared
    static var previews: some View {
        BookmarkPageView()
            .environmentObject(bookmarkVM)
    }
}
