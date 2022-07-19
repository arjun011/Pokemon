//
//  PokemonDetailsView.swift
//  Pokemon
//
//  Created by Arjun on 18/07/22.
//

import SwiftUI

struct PokemonDetailsView: View {
    @StateObject private var model:PokemonDetailsViewModel = PokemonDetailsViewModel()
    var detailsUrl:String?
    
    var body: some View {
        VStack {

            Text("Hello, World!")

        }.onAppear {
            Task {
                await model.getPokemonDetails(detailsUrl: detailsUrl)
            }
        }
        
        
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailsView()
    }
}
