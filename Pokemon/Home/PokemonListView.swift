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
                
                ForEach(self.model.pokemonList?.results ?? [ResultModel]()) { pokemon in
                    Text(pokemon.name ?? "Pokemon")
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
