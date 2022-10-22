//
//  MovieViewModel.swift
//  PopularMoviesApp
//
//  Created by Fernando Gnadt de Oliveira on 22/10/22.
//

import SwiftUI

class MovieViewModel: ObservableObject{
    @Published var movies: [Movie]?
    
    func fetchData() {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&api_key=<<YOUR_API_KEY>>")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            if let data = data {
                do{
                    let discover = try JSONDecoder().decode(Discover.self, from: data)
                    DispatchQueue.main.async {
                        self.movies = discover.results
                    }
                } catch (let error){
                    print(error)
                    return
                }
            } else {
                print("error")
                return
            }
        }.resume()
        
    }
}
