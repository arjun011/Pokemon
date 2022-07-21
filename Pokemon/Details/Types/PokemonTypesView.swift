//
//  PokemonTypesView.swift
//  Pokemon
//
//  Created by Arjun on 21/07/22.
//

import SwiftUI

struct PokemonTypesView: View {
    var pokemonDetails:PokemonDetailsModel?
    var body: some View {
        LazyHStack {
            
            ForEach(self.pokemonDetails?.types ?? [TypeElement]()) { elementType in
                
                Text((elementType.type?.name ?? "").capitalizingFirstLetter())
                    .font(.system(size: 15))
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                    .background(Color.white)
                    .cornerRadius(.infinity)
                
            }
            
        }
    }
}

struct PokemonTypesView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonTypesView()
    }
}
