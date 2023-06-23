//
//  MoviesAPI.swift
//  Literally
//
//  Created by Marcos Daniel on 22/06/23.
//

import Foundation
import TMDb



struct MoviesAPI{
    static private let API_KEY = "ca972630c6eb2a8cc93780fa74a24203"
    private let tmdbConfig = TMDbConfiguration(apiKey: API_KEY)
    
    
    
    func popular(completion: @escaping ([Movie]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?language=pt&page=1&api_key=\(MoviesAPI.API_KEY)")!

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let result = try decoder.decode(SearchResult.self, from: data)

                    var movies: [Movie] = []
                    for movie in result.results.prefix(5) {
                        let coverImage = "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")"
                        movies.append(
                            Movie(movieId: String(movie.id),
                                  title: movie.title,
                                  authors: ["movie"],
                                  description: movie.overview,
                                  coverImageURL: coverImage)
                        )
                    }

                    completion(movies)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
            }
        }

        dataTask.resume()
    }
    
    
    
    func topRated(completion: @escaping ([Movie]?) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?include_adult=false&language=pt-BR&page=1&api_key=\(MoviesAPI.API_KEY)")!

        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) -> Void in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase

                    let result = try decoder.decode(SearchResult.self, from: data)

                    var movies: [Movie] = []
                    for movie in result.results.prefix(5) {
                        let coverImage = "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")"
                        movies.append(
                            Movie(movieId: String(movie.id),
                                  title: movie.title,
                                  authors: ["movie"],
                                  description: movie.overview,
                                  coverImageURL: coverImage)
                        )
                    }

                    completion(movies)
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(nil)
                }
            } else if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
            }
        }

        dataTask.resume()
    }


    
    func search(query: String, completion: @escaping ([Movie]?) -> Void){
        let queryString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "resre"
        let headers = ["accept": "application/json"]
        let url = URL(string: "https://api.themoviedb.org/3/search/movie?query=\(queryString)&include_adult=false&language=pt-BR&page=1&api_key=\(MoviesAPI.API_KEY)")!
      
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) -> Void in
            
            if let data = data{
                let result = decodeJSON(data: data)
                var movies: [Movie] = []
                for movie in result!.results{
                    
                    let coverImage = "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")"
                    movies.append(
                        Movie(movieId: String(movie.id),
                              title: movie.title,
                              authors: ["movie"],
                              description: movie.overview,
                              coverImageURL: coverImage)
                    )
                }
                completion(movies)
            }
        
            if let error = error{
                print("\(error.localizedDescription)")
                completion(nil)
            }
            
            
        })
        
        dataTask.resume()
    }
}

struct Movies: Codable {
    let id: Int
    let title: String
    let posterPath: String?
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}

struct SearchResult: Codable {
    let results: [Movies]
}

func decodeJSON(data: Data) -> SearchResult?{
    print(data)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    do{
        return try decoder.decode(SearchResult.self, from: data)
    }
    catch let error{
        print(error.localizedDescription)
        return nil
    }

}
