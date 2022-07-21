//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    
    /// Pokemon list
    @Published var pokemonList:PokemonListModel?
    
    /// PokemonListClient
    private let client:PokemonListClient = PokemonListClient()
    
    /// Search pokemon by name
    @Published var searchPokemon:String = ""
    
    /// Fetch pokemon list
    @MainActor
    func getPokemonList(url:String?) async {
        
        do {
            let response = try await self.client.retrivePokemonList(url: url)
            
            switch response {
            case let .success(pokelist):
                
                if self.pokemonList?.results?.count ?? 0 > 0 {
                    
                    self.pokemonList?.next = pokelist.next
                    self.pokemonList?.results = (pokelist.results ?? [ResultModel]()) + (self.pokemonList?.results ?? [ResultModel]())
                    
                }else {
                    
                    self.pokemonList = pokelist
                }
                
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
