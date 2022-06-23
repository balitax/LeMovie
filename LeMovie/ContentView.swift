//
//  ContentView.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI

struct ContentView: View {
    
    enum TabsMenuItems {
        case home, search, bookmark
    }
    
    @State var tabSelection: TabsMenuItems = .home
    
    var body: some View {
        TabView(selection: $tabSelection) {
            HomePageView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
                }
                .tag(TabsMenuItems.home)
            
            SearchPageView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(TabsMenuItems.search)
            
            BookmarkPageView()
                .tabItem {
                    VStack {
                        Image(systemName: "bookmark")
                        Text("Bookmark")
                    }
                }
                .tag(TabsMenuItems.bookmark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

