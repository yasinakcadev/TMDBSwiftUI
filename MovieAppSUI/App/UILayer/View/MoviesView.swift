//
//  ContentView.swift
//  MovieAppSUI
//
//  Created by YASIN on 19.04.2023.
//

import SwiftUI

struct MoviesView: View {
    @EnvironmentObject var viewModel: MovieViewModel
    
    var body: some View {
        List {
            Section(header: Text("Popular Movies")) {
                ForEach(viewModel.movies) { movie in
                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                        MovieCardView(movie: movie)
                    }
                }
            }
        }
        .font(.headline)
        .navigationTitle("Movie Fan")
        .onAppear {
            viewModel.getMovies()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            MoviesView()
                .environmentObject(MovieViewModel())
        }
    }
}
