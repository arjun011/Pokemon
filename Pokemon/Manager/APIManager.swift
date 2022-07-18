//
//  APIManager.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation

/// Base URL
fileprivate let baseUrl = "https://pokeapi.co/api/v2/"

/// API Constant manage all API
struct APIConstant {
    
    /// Retrive pokemon list
    static let getPokemonList = baseUrl + "pokemon"
}


