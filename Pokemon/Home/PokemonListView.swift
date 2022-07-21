//
//  PokemonListView.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var model = PokemonListViewModel()
    
    @State var defaultBaseCurrency:String = "USD"
    @State var showPokemonDetailsView:Bool = false
    @State var selectedPokemon:ResultModel?
    
    var body: some View {
        
        /// Navigation view
        NavigationView {
            
            VStack{
                
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
                    PokemonListCellView(pokemonDetail: pokemon)
                        .contentShape(RoundedRectangle(cornerRadius: 0))
                        .onTapGesture {
                            
                            self.selectedPokemon = pokemon
                            self.showPokemonDetailsView.toggle()
                            
                        }
                }
                
            }
        
    }
}

struct PokemonListView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
