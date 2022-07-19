//
//  PokemonDetailsViewModel.swift
//  Pokemon
//
//  Created by Arjun on 19/07/22.
//

import Foundation

class PokemonDetailsViewModel:ObservableObject {
    
    /// Pokemon details model
    @Published var pokemonDetails:PokemonDetailsModel?
    
    /// Pokemon details Client
    private let client:PokemonDetailsClient = PokemonDetailsClient()
    
    
    @MainActor
    /// Get pokemon details
    /// - Parameter detailsUrl: Selected pokemon details
    func getPokemonDetails(detailsUrl:String?) async {
        
        do {
            let response = try await self.client.retrivePokemonDetails(detailsUrl: detailsUrl ?? "")
            
            switch response {
            case let .success(pokelist):
                
                self.pokemonDetails = pokelist
                
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
