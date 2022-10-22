//
//  Discover.swift
//  PopularMoviesApp
//
//  Created by Fernando Gnadt de Oliveira on 22/10/22.
//

import SwiftUI

struct Discover: Decodable {
    let results: [Movie]
    
}

struct Movie: Identifiable, Decodable {
    let id: Int
    let title: String
    let overview: String?
    let poster_path: String
    let vote_average: Float
}
