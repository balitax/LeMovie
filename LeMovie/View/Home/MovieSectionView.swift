//
//  MovieSectionView.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI
import Kingfisher
import GSNetwork

struct MovieSectionView: View {
    
    public let movies: [MovieDB]
    public let titleSection: String
    @State var overlayTitle: Bool = false
    @State var setWidthImage: CGFloat = UIScreen.main.bounds.size.width - 40
    @State var setHeightImage: CGFloat = 180
    @State var currentSlider: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            
            Text(titleSection)
                .font(.body)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16.0) {
                    ForEach(movies) { movie in
                        NavigationLink(destination: DetailMovieView(movie: movie)) {
                            MovieCardView(movie: movie, overlayTitle: overlayTitle, setWidthImage: setWidthImage, setHeightImage: setHeightImage)
                        }
                        .buttonStyle(.plain)
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
        .padding(.top)
    }
}


struct NowPlayingSectionView_Previews: PreviewProvider {
    @StateObject static var homeViewModel = HomeViewModel()
    static var previews: some View {
        MovieSectionView(movies: [], titleSection: "Now Playing Movie")
    }
}

struct MovieCardView: View {
    
    @EnvironmentObject var bookmarkViewModel: BookmarkViewModel
    
    let movie: MovieDB
    let overlayTitle: Bool
    @State var setWidthImage: CGFloat
    @State var setHeightImage: CGFloat
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .top) {
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
                    .frame(width: setWidthImage, height: setHeightImage)
                    .overlay(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.01), Color.black.opacity(0.5)]), startPoint: .top, endPoint: .bottom))
                    .overlay(content: {
                        Text(movie.originalTitle ?? "")
                            .multilineTextAlignment(.leading)
                            .font(.body.bold())
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .lineLimit(1)
                            .frame(width: UIScreen.main.bounds.size.width - 60)
                    })
                    .cornerRadius(8)
                
                VStack(spacing: 20) {
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
                .offset(x: setWidthImage - 40, y: 8)
            }
            
            if overlayTitle == false {
                Text(movie.originalTitle ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding(.top, 4)
                    .frame(width: setWidthImage)
            }
            
        }
    }
    
    private func toggleBookmark(for movie: MovieDB) {
        if bookmarkViewModel.isBookmarked(for: movie) {
            bookmarkViewModel.removeBookmark(for: movie)
        } else {
            bookmarkViewModel.addBookmark(for: movie)
        }
    }
}
