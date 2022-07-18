//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import SwiftUI
import PokemonAPI
struct PokemonListView: View {
    @StateObject var model = PokemonListViewModel()
    var body: some View {
        
        VStack{

            List {
                
                ForEach((model.pokemon?.results ?? [PKMAPIResource<PKMPokemon>]()), id: \.self) { key in
                    
                    Text("\(key.name ?? "")")
                }
                
            }.listStyle(.grouped)

        }.onAppear {
            Task {
                await model.getPokemonList()
            }
        }
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
