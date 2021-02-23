//
//  PokemonModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 21.02.2021.
//

import Foundation


struct PokemonModel: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    
}

let MOCK_POKEMON: [PokemonModel] = [

        .init(id: 0, name: "Barbaros", imageUrl: "1", type: "dövüş"),
        .init(id: 1, name: "Ahmet", imageUrl: "1", type: "tekme"),
        .init(id: 2, name: "Mehmet", imageUrl: "1", type: "atletik"),
        .init(id: 3, name: "Veli", imageUrl: "1", type: "yumruk"),
        .init(id: 4, name: "Ali", imageUrl: "1", type: "tükürük")
]
