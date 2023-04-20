//
//  MovieCardView.swift
//  MovieAppSUI
//
//  Created by YASIN on 19.04.2023.
//

import SwiftUI

struct MovieCardView: View {
    let movie: Movie
    var body: some View {
        VStack {
            HStack {
                Text(movie.title)
                    .foregroundColor(.cyan)
                    .font(.custom("HelveticaNeue-Bold", size: 18))
                    //.multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading,20)
                AsyncImage(url: URL(string: movie.getImageUrl())) { image in
                    image.resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 150)
                } placeholder: {
                    ProgressView()
                }.frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing,10)

            }
            
            HStack {
                Text(movie.releaseDate)
                    .foregroundColor(.cyan)
                    .font(.custom("HelveticaNeue", size: 16))
                    .padding(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCardView(movie: Movie(id: 1,
                            title: "Deneme title",
                            releaseDate: "10.02.2023",
                            imageUrlSuffix: "",
                            overview: ""))
    }
}
