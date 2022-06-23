//
//  LeMovieApp.swift
//  LeMovie
//
//  Created by Agus cahyono on 17/06/22.
//

import SwiftUI

@main
struct LeMovieApp: App {
    
    @StateObject var bookmarkViewModel: BookmarkViewModel
    
    init() {
        self._bookmarkViewModel = StateObject(wrappedValue: BookmarkViewModel.shared)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(bookmarkViewModel)
        }
    }
}
