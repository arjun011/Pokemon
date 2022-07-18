//
//  PokemonListViewModel.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation
import PokemonAPI
class PokemonListViewModel: ObservableObject {
    
   @Published var pokemon:PKMPagedObject<PKMPokemon>?
    
    /// Fetch pokemon list
    @MainActor
    func getPokemonList() async {
        
        do {
            pokemon = try await PokemonAPI().pokemonService.fetchPokemonList(paginationState: .initial(pageLimit: 50))
            debugPrint(pokemon?.results)
        }
        catch {
            print(error.localizedDescription)
        }
    }

}
