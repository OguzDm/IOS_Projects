//
//  PokemonCell.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 16.02.2021.
//

import SwiftUI
import Kingfisher


struct PokemonCell: View {
    let pokemon : PokemonModel
    let viewModel : PokemonViewModel
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,16)
                    .padding(.leading)
                
                HStack {
                    Text(pokemon.type)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color.white.opacity(0.42))
                        )
                        .frame(width: 100,height: 24)
                    
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .frame(width:68,height: 68)
                        .padding([.bottom,.trailing],4)
                }
            }
        }
        .background(viewModel.backgroundColor(forType: pokemon.type))
        .cornerRadius(8)
        .shadow(color: viewModel.backgroundColor(forType: pokemon.type), radius: 6, x: 0.0, y: 0.0)
        
    }
}
