//
//  PokemonListCell.swift
//  Pokemon
//
//  Created by Arjun on 21/07/22.
//

import SwiftUI

struct PokemonListCellView: View {
    var pokemonDetail:ResultModel?
    var body: some View {
        
        HStack(alignment: .center) {
            /// Cell view
            Text((pokemonDetail?.name ?? "Pokemon").capitalizingFirstLetter())
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        
    }
}

struct PokemonListCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListCellView()
    }
}
