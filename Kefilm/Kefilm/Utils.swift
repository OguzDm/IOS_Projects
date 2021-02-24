//
//  Utils.swift
//  Kefilm
//
//  Created by Oguz Demırhan on 26.01.2021.
//

import Foundation


class Utils {
    
    static let jsonDecoder : JSONDecoder = {
       
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
}
