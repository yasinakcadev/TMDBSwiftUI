//
//  Movie.swift
//  MovieAppSUI
//
//  Created by YASIN on 19.04.2023.
//

import Foundation

struct MovieRootResult: Codable {
    let page: Int
    let movies: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
    }
}

struct Movie: Codable, Identifiable {
    struct Constants {
        static let baseImageUrl = "https://image.tmdb.org/t/p/"
        static let logoSize = "w500"
    }
    
    var id: Int
    let title: String
    let releaseDate: String
    let imageUrlSuffix: String
    let overview: String
    
    func getImageUrl() -> String {
        return "\(Constants.baseImageUrl)\(Constants.logoSize)\(imageUrlSuffix)"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case imageUrlSuffix = "poster_path"
        case overview
    }
}
