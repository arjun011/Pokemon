//
//  PokemonAboutView.swift
//  Pokemon
//
//  Created by Arjun on 21/07/22.
//

import SwiftUI

struct PokemonAboutView: View {
    
    var pokemonDetails:PokemonDetailsModel?
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 20) {
        
            VStack(alignment: .leading, spacing: 10) {
                    
                Text("Species")
                Text("Height")
                Text("Weight")
                
                
            }.foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 10) {
                    
                Text(self.pokemonDetails?.species?.name ?? "")
                Text("\(self.pokemonDetails?.height ?? 0)")
                Text("\(self.pokemonDetails?.weight ?? 0)")
            }
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)

        
    }
}

struct PokemonAboutView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonAboutView()
    }
}
