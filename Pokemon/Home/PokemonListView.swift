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
        VStack{
            Text("Hello, World!")
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
