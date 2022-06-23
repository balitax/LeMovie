//
//  BookmarkViewModel.swift
//  LeMovie
//
//  Created by Agus cahyono on 20/06/22.
//

import SwiftUI
import GSNetwork

@MainActor
public class BookmarkViewModel: ObservableObject {
    
    @Published public var searchBookmark: String = ""
    @Published var bookmarks: [MovieDB] = []
    
    private let bookmarkStore = MovieDataStore<[MovieDB]>(filename: "bookmarks")
    public static let shared = BookmarkViewModel()
    
    private init() {
        Task {
            await load()
        }
    }
    
    private func load() async {
        bookmarks = await bookmarkStore.load() ?? []
    }
    
    public func isBookmarked(for movie: MovieDB) -> Bool {
        Task {
            await load()
        }
        return bookmarks.first { $0.id == movie.id } != nil
    }
    
    public func addBookmark(for movie: MovieDB) {
        Task {
            await load()
        }
        guard !isBookmarked(for: movie) else { return }
        bookmarks.insert(movie, at: 0)
        bookmarkUpdated()
    }
    
    public func removeBookmark(for movie: MovieDB) {
        guard let index = bookmarks.firstIndex(where: { $0.id == movie.id }) else {
            return
        }
        bookmarks.remove(at: index)
        bookmarkUpdated()
    }
    
    private func bookmarkUpdated() {
        let bookmarks = self.bookmarks
        Task {
            await bookmarkStore.save(bookmarks)
        }
    }
    
    
}
