//
//  DetailMovieView.swift
//  LeMovie
//
//  Created by Agus cahyono on 21/06/22.
//

import SwiftUI
import GSNetwork
import FancyScrollView
import Kingfisher

struct DetailMovieView: View {
    
    var movie: MovieDB?
    @StateObject var detailViewModel = DetailViewModel()
    @State var presentTrailer: Bool = false
    
    var body: some View {
        VStack {
            FancyScrollView(
                headerHeight: 400,
                scrollUpHeaderBehavior: .parallax,
                scrollDownHeaderBehavior: .offset,
                header: {
                    KFImage(movie?.posterURL)
                        .placeholder({ _ in
                            ProgressView()
                        })
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .background(.gray.opacity(0.5))
                }) {
                    VStack(alignment: .leading) {
                        buildTitle()
                        buildDescription()
                        buildRating()
                        buildReleaseDate()
                        buildTrailers()
                    }
                    .padding(.bottom)
                }
                .onAppear {
                    Task {
                        await detailViewModel.loadVideoTrailer(for: movie?.id ?? 0)
                    }
                }
        }
    }
    
    @ViewBuilder
    func buildTitle() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(movie?.originalTitle ?? "")
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding()
    }
    
    @ViewBuilder
    func buildDescription() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Description")
                .font(.headline)
                .fontWeight(.bold)
            
            Text(movie?.overview ?? "")
        }
        .padding()
    }
    
    @ViewBuilder
    func buildRating() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Rating")
                .font(.headline)
                .fontWeight(.bold)
            
            HStack {
                Text(movie?.ratingText ?? "")
                Text(movie?.scoreText ?? "")
                Spacer()
            }
            
            Text("Vote Count : \(movie?.voteCount ?? 0) votes")
        }
        .padding()
    }
    
    @ViewBuilder
    func buildReleaseDate() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Release Date")
                .font(.headline)
                .fontWeight(.bold)
            
            Text(movie?.releaseDate ?? "")
        }
        .padding()
    }
    
    @ViewBuilder
    func buildTrailers() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Trailer")
                .font(.headline)
                .fontWeight(.bold)
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16.0) {
                    ForEach(detailViewModel.trailers) { trailer in
                        VStack {
                            
                            KFImage(trailer.coverImageURL)
                                .placeholder({ _ in
                                    ProgressView()
                                })
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .background(.gray.opacity(0.5))
                                .frame(width: 200, height: 120)
                                .cornerRadius(4.0)
                            
                            Text(trailer.name)
                                .font(.footnote)
                                .frame(maxWidth: 200)
                        }
                        .onTapGesture {
                            self.presentTrailer.toggle()
                        }
                        .buttonStyle(.plain)
                        .padding(.leading, trailer.id == detailViewModel.trailers.first!.id ? 16 : 0)
                        .padding(.trailing, trailer.id == detailViewModel.trailers.last!.id ? 16 : 0)
                        .sheet(isPresented: $presentTrailer, content: {
                            if let url = trailer.youtubeURL {
                                SafariView(url: url)
                                    .presentationDetents([.fraction(0.7)])
                            }
                        })
                    }
                }
            }
            
        }
    }
    
    
    
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        DetailMovieView(movie: nil)
    }
}
