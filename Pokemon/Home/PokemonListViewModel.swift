//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    @Published var pokemonList:PokemonListModel?
    private let client:PokemonListClient = PokemonListClient()
    
    /// Search pokemon by name
    @Published var searchPokemon:String = ""
    
    /// Fetch pokemon list
    @MainActor
    func getPokemonList() async {
        
        do {
            let response = try await self.client.retrivePokemonList()
            
            switch response {
            case let .success(pokelist):
                
                self.pokemonList = pokelist
                
            case let .error(error):
                debugPrint("====>\(error)")
            case .offline:
                debugPrint("Offline")
            }
        }catch {
            debugPrint(error.localizedDescription)
        }
    }

}
