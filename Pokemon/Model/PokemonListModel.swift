//
//  PokemonListModel.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//


import Foundation

struct PokemonListModel: Codable {
    
    var count: Int?
    var next: String?
    var previous: String?
    var results: [ResultModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case count = "count"
        case next = "next"
        case previous = "previous"
        case results = "results"
        
    }
    
}

// MARK: - Result
struct ResultModel: Codable , Identifiable{
    var id = UUID()
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        
        case name = "name"
        case url = "url"
        
    }
    
}
