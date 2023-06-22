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
    
    func search(q: String) async{
        
        do {
            try await SearchService(config: self.tmdbConfig).searchMovies(query: q)
        }
        catch {
        
        }
    }
}
