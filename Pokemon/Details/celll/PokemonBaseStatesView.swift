//
//  PokemonBaseStatesView.swift
//  Pokemon
//
//  Created by Arjun on 21/07/22.
//

import SwiftUI

struct PokemonBaseStatesView: View {
    var pokemonStat:Stat?
    var body: some View {
        
        HStack(alignment: .center, spacing: 10) {
            
            Text(pokemonStat?.stat?.name ?? "")
                .foregroundColor(.secondary)
            
            Text("\(pokemonStat?.baseStat ?? 0)")
            
            ProgressView(value: (Float((pokemonStat?.baseStat ?? 1) < 100 ? (pokemonStat?.baseStat ?? 1) : 100) / 100))
            
        }
    }
}

struct PokemonBaseStatesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonBaseStatesView()
    }
}
