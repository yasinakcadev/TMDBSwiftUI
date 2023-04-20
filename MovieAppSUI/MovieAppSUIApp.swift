//
//  MovieAppSUIApp.swift
//  MovieAppSUI
//
//  Created by YASIN on 19.04.2023.
//

import SwiftUI

@main
struct MovieAppSUIApp: App {
    let viewModel = MovieViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MoviesView()
                    .environmentObject(viewModel)
            }
        }
    }
}
