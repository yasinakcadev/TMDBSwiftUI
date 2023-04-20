//
//  MovieViewModel.swift
//  MovieAppSUI
//
//  Created by YASIN on 19.04.2023.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var error: DataError? = nil
    
    private let apiService: MovieAPILogic
    
    init(apiService: MovieAPILogic = MovieAPI()) {
        self.apiService = apiService
    }
    
    func getMovies() {
        apiService.getMovies {[weak self] result in
            switch result {
            case .failure(let error):
                self?.error = error
            case .success(let movies):
                self?.movies = movies ?? []
            }
        }
    }
}
