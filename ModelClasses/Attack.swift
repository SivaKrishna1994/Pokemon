//
//  Attack.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import Foundation
public struct Attack: Codable {
    public var cost: [String]?
    public var name, text, damage: String?
    public var convertedEnergyCost: Int?
}
