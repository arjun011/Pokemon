//
//  PokemonDetailsClient.swift
//  Pokemon
//
//  Created by Arjun on 19/07/22.
//

import Foundation
import SwiftUI

class PokemonDetailsClient {
    
    /// Retrive Pokemon details
    /// - Parameter detailsUrl: selected pokemon URL
    /// - Returns: PokemonDetailsModel
    func retrivePokemonDetails(detailsUrl:String) async throws -> ResponseManager<PokemonDetailsModel> {
        
        debugPrint(detailsUrl)
        
        do {
            let request = try ClientManager.GET(detailsUrl)
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw ValidationError.invalidServerResponse }
            
            let session = try JSONDecoder().decode(PokemonDetailsModel.self, from: data)
            
            return ResponseManager.success(session)
        }catch {
            
            debugPrint(error.localizedDescription)
            
            debugPrint(error)
            
            throw ValidationError.invalidServerResponse
        }
    }
}
