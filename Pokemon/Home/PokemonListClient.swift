//
//  PokemonListClient.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import Foundation

class PokemonListClient {
    
    /// Retrive pokemonList
    /// - Returns: PokemonListModel
    func retrivePokemonList() async throws -> ResponseManager<PokemonListModel> {
        
        let getPokemonList = APIConstant.getPokemonList
        debugPrint(getPokemonList)
        
        do {
            let request = try ClientManager.GET(getPokemonList)
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ValidationError.invalidServerResponse }
            
            let session = try JSONDecoder().decode(PokemonListModel.self, from: data)
            
            return ResponseManager.success(session)
        }catch {
            
            debugPrint(error.localizedDescription)
            
            debugPrint(error)
            
            throw ValidationError.invalidServerResponse
        }
    }
}
