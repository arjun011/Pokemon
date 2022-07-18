//
//  PokemonListModel.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation

struct PokemonListModel:Codable {
    
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Result]?
    
}

// MARK: - Result
struct ResultModel:Codable {
    var name: String?
    var url: String?
}
