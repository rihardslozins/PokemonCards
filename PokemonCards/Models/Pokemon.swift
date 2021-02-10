//
//  Pokemon.swift
//  PokemonCards
//
//  Created by Rihards Lozins on 09/02/2021.
//

import Foundation


struct Pokemon: Decodable {
    let name: String
    var imageUrl: String?
    let number: String
    let rarity: String
    let subtype: String
    
    enum CodingKeys: String, CodingKey {
        
        case name
        case imageUrl
        case number
        case rarity
        case subtype
    }
}

struct Card: Decodable {
    let cards: [Pokemon]
    
    
}
