//
//  File.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import Foundation
public class Card:Codable{
	public var id: String?
	public var name: String?
    public var nationalPokedexNumber: Int?
    public var imageURL, imageURLHiRes: String?
    public var types: [String]?
    public var supertype, subtype, hp: String?
    public var retreatCost: [String]?
    public var convertedRetreatCost: Int?
    public var number, artist, rarity, series: String?
    public var cardSet, setCode: String?
    public var attacks: [Attack]?
    public var resistances, weaknesses: [Resistance]?
	public var text: [String]?
    public var evolvesFrom: String?
    public var ability: Ability?

    enum CodingKeys: String, CodingKey {
        case id, name, nationalPokedexNumber
        case imageURL = "imageUrl"
        case imageURLHiRes = "imageUrlHiRes"
        case types, supertype, subtype, hp, retreatCost, convertedRetreatCost, number, artist, rarity, series
        case cardSet = "set"
        case setCode, attacks, resistances, weaknesses
    }
}
