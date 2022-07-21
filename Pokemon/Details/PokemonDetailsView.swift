//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import SwiftUI
import SDWebImageSwiftUI
struct PokemonDetailsView: View {
    @StateObject private var model:PokemonDetailsViewModel = PokemonDetailsViewModel()
    var detailsUrl:String?
    
    var body: some View {
        
        ZStack {
            
            Color("DetaisBG")
                .ignoresSafeArea(edges: .all)
            
            ScrollView {
                
                VStack(alignment: .center, spacing: 10) {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack(alignment: .center) {
                            
                            Text((self.model.pokemonDetails?.name ?? "").capitalizingFirstLetter())
                                .font(.system(size: 35, weight: .bold))
                            
                            Spacer()
                            
                            Text("#0\(self.model.pokemonDetails?.id ?? 1)")
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            
                            PokemonTypesView(pokemonDetails: self.model.pokemonDetails)
                        }
                        .frame(height: 40)
                        
                    }.frame(height: 100, alignment: .center)
                        .padding(.horizontal)
                    
                    
                    VStack(alignment: .center) {
                        
                        HStack(alignment: .center) {
                            
                            Spacer()
                            
                            WebImage(url: URL(string: self.model.pokemonDetails?.sprites?.other?.officialArtwork?.frontDefault ?? ""))
                                .resizable()
                                .renderingMode(.original)
                                .indicator(.activity)
                                .frame(width: 200, height: 250, alignment: .center)
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                            
                            Spacer()
                            
                        }
                        
                        VStack(alignment: .center) {
                            
                            Picker("", selection: self.$model.selectedSegment) {
                                Text("About").tag(0)
                                Text("Base Stats").tag(1)
                            }
                            .pickerStyle(.segmented)
                            .padding()
                            
                            Spacer()
                            
                            if self.model.selectedSegment == 0 {
                                PokemonAboutView(pokemonDetails: self.model.pokemonDetails)
                                    .padding(.horizontal, 25)
                            }else {
                            
                                PokemonBaseStatesView(pokemonDetails: self.model.pokemonDetails)
                                    .padding(.horizontal, 25)
                                
                            }
                            
                            Spacer()
                            
                        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .cornerRadius(40, corners: [.topLeft, .topRight])
                            .padding()
                           
                    }
                    
                }
            }
            
        }.onAppear {
            Task {
                await model.getPokemonDetails(detailsUrl: detailsUrl)
            }
        }
        
        
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView(detailsUrl: "https://pokeapi.co/api/v2/pokemon/1/")
    }
}
