//
//  PokemonBaseStatesView.swift
//  Pokemon
//
//  Created by Arjun on 21/07/22.
//

import SwiftUI

struct PokemonBaseStatesView: View {
    
    var pokemonDetails:PokemonDetailsModel?
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            ForEach(self.pokemonDetails?.stats ??  [Stat]()) { stateObj in
                
                PokemonBaseStateCellView(pokemonStat: stateObj)
                
            }
            
        }.padding(.horizontal, 25)
    }
}

struct PokemonBaseStatesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBaseStatesView()
    }
}
