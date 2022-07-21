//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import SwiftUI

struct PokemonListView: View {
    
    /// PokemonListviewModel
    @StateObject var model:PokemonListViewModel = PokemonListViewModel()
    
    /// Show pokemon details view
    @State var showPokemonDetailsView:Bool = false
    
    /// Selected pokemon object
    @State var selectedPokemon:ResultModel?
    
    var body: some View {
        
        VStack{
            
            /// Navigation link for pokemon details
            NavigationLink(destination: PokemonDetailsView(detailsUrl: selectedPokemon?.url), isActive: $showPokemonDetailsView,
                           label: { })
            
            /// List of Pokemons
            List {
                
                ForEach(self.model.pokemonList?.results ?? [ResultModel]()) { pokemon in
                    
                    /// Cell view
                    PokemonListCellView(pokemonDetail: pokemon)
                        .contentShape(RoundedRectangle(cornerRadius: 0))
                        .onTapGesture {
                            
                            self.selectedPokemon = pokemon
                            self.showPokemonDetailsView.toggle()
                            
                        }
                }
                
            }.listStyle(.grouped)
                .refreshable {
                    
                    /// Pull to refersh data
                    guard let nextAPI = model.pokemonList?.next else {
                        return
                    }
                    Task {
                        await self.model.getPokemonList(url: nextAPI)
                    }
                }
            
                /// Search bar
                .searchable(text: self.$model.searchPokemon) {
                    
                    /// Filter pokemon list acording to serach text
                    let searchableList = (self.model.pokemonList?.results ?? [ResultModel]()).filter{($0.name ?? "").capitalized.contains(self.model.searchPokemon.capitalized)}
                    
                    ForEach(searchableList) { pokemon in
                        
                        /// Cell view
                        PokemonListCellView(pokemonDetail: pokemon)
                            .contentShape(RoundedRectangle(cornerRadius: 0))
                            .onTapGesture {
                                
                                self.selectedPokemon = pokemon
                                self.showPokemonDetailsView.toggle()
                                
                            }
                    }
                    
                }
            
        }.onAppear {
            
            guard model.pokemonList?.results?.count ?? 0 == 0 else {
                return
            }
            
            Task {
                /// Retrive pokemon list from API
                await model.getPokemonList(url: nil)
            }
        }
        .navigationTitle("Pokemons")
    }
    
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
