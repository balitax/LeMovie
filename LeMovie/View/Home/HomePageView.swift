//
//  HomePageView.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI
import Kingfisher
import GSNetwork

struct HomePageView: View {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                MovieSectionView(
                    movies: homeViewModel.nowPlaying,
                    titleSection: "Now Playing",
                    overlayTitle: true)
                .overlay(homeViewModel.overlayNowPlayingView)
                .task {
                    Task { await homeViewModel.loadMovie(for: .nowPlaying) }
                }
                
                MovieSectionView(
                    movies: homeViewModel.upcoming,
                    titleSection: "Upcoming",
                    setWidthImage: UIScreen.main.bounds.size.width - 120,
                    setHeightImage: 120)
                .overlay(homeViewModel.overlayUpcomingView)
                .task {
                    Task { await homeViewModel.loadMovie(for: .upcoming) }
                }
                
                LazyVStack(pinnedViews: [.sectionHeaders]){
                    Section(header: sortSectionHeader()) {
                        MovieGridListView(movies: homeViewModel.movies)
                            .task {
                                Task {
                                    await homeViewModel.loadMovie(for: .popular)
                                }
                            }
                    }
                }
            }
            .navigationBarTitle("LeMovie")
        }
    }
    
    
    
    @ViewBuilder
    func sortSectionHeader() -> some View {
        SortByMenu(sorts: homeViewModel.sorts) { sort in
            print("SHORTED BY ", sort.rawValue)
            Task {
                await homeViewModel.loadMovie(for: sort)
            }
        }
        .frame(height: 50)
        .background(.white)
    }
    
}


struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
