//
//  MovieAPI.swift
//  MovieAppSUI
//
//  Created by YASIN on 19.04.2023.
//

import Foundation
import Alamofire

protocol MovieAPILogic {
    func getMovies(completion: @escaping ((Result<[Movie]?,DataError>) -> Void))
}

class MovieAPI: MovieAPILogic {
    
    private struct Constants {
        static let apiKey = "4fe590f0cf34e10348378aa576f2e2a5"
        static let languageLocale = "en-US"
        static let moviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKey)&language=\(languageLocale)&page=\(pageValue)"
        static let pageValue = 1
        static let rParameter = "r"
        static let json = "json"
    }
    
    func getMovies(completion: @escaping ((Result<[Movie]?, DataError>) -> Void)) {
        //Preventing AF to retrieve cached response
        URLCache.shared.removeAllCachedResponses()
        
        AF.request(
            Constants.moviesURL,
            method: .get,
            encoding: URLEncoding.default)
        .validate()
        .responseDecodable(of: MovieRootResult.self) { response in
            switch response.result {
            case .failure(let error):
                completion(.failure(.networkingError(error.localizedDescription)))
            case .success(let moviesListResult):
                completion(.success(moviesListResult.movies))
            }
        }
    }
    
}
