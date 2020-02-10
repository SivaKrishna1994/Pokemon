//
//  SetElement.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 2/1/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import Foundation
public class SetElement: Codable {
    public var code: String?
    public var ptcgoCode: String?
    public var name, series: String?
    public var totalCards: Int?
    public var standardLegal, expandedLegal: Bool?
    public var releaseDate: String?
    public var symbolURL, logoURL: String?
    public var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case code, ptcgoCode, name, series, totalCards, standardLegal, expandedLegal, releaseDate
        case symbolURL = "symbolUrl"
        case logoURL = "logoUrl"
        case updatedAt
    }
}
