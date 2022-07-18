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
        
        /// Navigation view
        NavigationView {
            
            VStack{
                
                /// List of Pokemons
                List {
                    
                    ForEach(self.model.pokemonList?.results ?? [ResultModel]()) { pokemon in
                        
                        /// Cell view
                        Text(pokemon.name ?? "Pokemon")
                    }
                    
                }.listStyle(.grouped)
                
            }.onAppear {
                
                Task {
                    /// Retrive pokemon list from API
                    await model.getPokemonList()
                }
            }
            .navigationTitle("Pokemons")
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
