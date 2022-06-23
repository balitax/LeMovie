//
//  MovieGridListView.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI
import Kingfisher
import GSNetwork

struct MovieGridListView: View {
    
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel
    let movies: [MovieDB]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 4), count: 2)
    
    var body: some View {
        VStack {
            // MARK: - GRID VIEW
            LazyVGrid(columns: columns) {
                ForEach(movies){ movie in
                    NavigationLink(destination: DetailMovieView(movie: movie)) {
                        CardView(for: movie)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
    
    
    @ViewBuilder
    func CardView(for movie: MovieDB) -> some View {
        VStack {
            
            ZStack(alignment: .top) {
                
                // MARK: -- MOVIE IMAGE
                KFImage.url(movie.posterURL)
                    .placeholder({ progress in
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    })
                    .retry(maxCount: 3, interval: .seconds(5))
                    .loadDiskFileSynchronously()
                    .cacheMemoryOnly()
                    .fade(duration: 0.5)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.01), Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                    .frame(height: 250)
                    .cornerRadius(8)
                
                
                VStack(spacing: 20) {
                    // MARK: BOOKMARK BUTTON
                    Button {
                        toggleBookmark(for: movie)
                    } label: {
                        Image(systemName: bookmarkViewModel.isBookmarked(for: movie) ? "bookmark.fill" : "bookmark")
                            .font(.system(size: 13))
                            .foregroundColor(.blue)
                            .padding(5)
                            .background(Color.white, in: Circle())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .offset(x: UIScreen.main.bounds.size.width / 2.9, y: 10)
                
            }
            
            Text(movie.originalTitle ?? "")
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineLimit(1)
                .padding(.top, 4)
            
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        
    }
    
    private func toggleBookmark(for movie: MovieDB) {
        if bookmarkViewModel.isBookmarked(for: movie) {
            bookmarkViewModel.removeBookmark(for: movie)
        } else {
            bookmarkViewModel.addBookmark(for: movie)
        }
    }
    
}

//struct MovieGridListView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieGridListView(movies: Movies.previews)
//    }
//}
