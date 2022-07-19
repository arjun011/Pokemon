//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var model = PokemonListViewModel()
    var body: some View {
        
        /// Navigation view
        NavigationView {
            
            VStack{
                
                /// List of Pokemons
                List {
                    
                    ForEach(self.model.pokemonList?.results ?? [ResultModel]()) { pokemon in
                        
                        NavigationLink(destination: PokemonDetailsView()) {
                            /// Cell view
                            Text((pokemon.name ?? "Pokemon").capitalizingFirstLetter())
                        }
                    
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
        .searchable(text: self.$model.searchPokemon) {
            
            let searchableList = (self.model.pokemonList?.results ?? [ResultModel]()).filter{($0.name ?? "").capitalized.contains(self.model.searchPokemon.capitalized)}

            ForEach(searchableList) { pokemon in

                /// Cell view
                Text(pokemon.name ?? "Pokemon")
            }
            
        }
        
        
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
