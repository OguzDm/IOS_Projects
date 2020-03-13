//
//  WeatherData.swift
//  Clima
//
//  Created by Squiretoss on 23.11.2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData:Decodable{
    
    let name : String
    let weather :[Weather]
    let main : Main
    
}

struct Weather:Decodable{
    let id : Int
}

struct Main :Decodable{
    let temp :Double
}
