//
//  PokemonViewModel.swift
//  PokedexSwiftUI
//
//  Created by Oguz Demırhan on 22.02.2021.
//

import SwiftUI

class PokemonViewModel: ObservableObject {
    @Published var pokemon = [PokemonModel]()
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchPokemon()
    }
    func fetchPokemon(){
        guard let url = URL(string: baseURL) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            guard let data = data?.parseData(removeString: "null,") else {return}
            guard let decodedPokemon = try? JSONDecoder().decode([PokemonModel].self, from: data) else {return}
            
            DispatchQueue.main.async {
                
                self.pokemon = decodedPokemon
            }
        }.resume()
        
    }
    
    func backgroundColor (forType type: String ) -> Color {
        switch type {
            case "fire":
                return .red
            case "poison":
                return .green
            case "water":
                return .blue
            case "electric":
                return .yellow
            case "psychic":
                return .purple
            case "normal":
                return .secondary
            case "ground":
                return .gray
            case "flying":
                return .accentColor
            case "fairy":
                return .pink
            default:
                return .orange
        }
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {return nil}
        
        return data
    }
}
