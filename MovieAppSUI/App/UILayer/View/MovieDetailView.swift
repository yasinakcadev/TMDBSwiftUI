//
//  MovieDetailView.swift
//  MovieAppSUI
//
//  Created by YASIN on 20.04.2023.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            Text(movie.title)
                .font(.largeTitle)
            AsyncImage(url: URL(string: movie.getImageUrl())) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 250,height: 250)
            } placeholder: {
                ProgressView()
            }
            Text(movie.overview)
                .padding()
        }
        .navigationTitle("Movie Detail")
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie(id: 1, title: "", releaseDate: "", imageUrlSuffix: "", overview: ""))
    }
}
