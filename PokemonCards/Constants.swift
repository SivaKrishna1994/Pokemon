//
//  Constants.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import Foundation

	public enum urlConstants: String{
		case baseUrl = "https://api.pokemontcg.io/v1/"
		case cardWithName = "cards?name="
		case cardPagination = "cards?page="
		case sets = "sets"
		case setsWithId = "cards?setCode="
		case cardsWithNameId = "cards/"
	}

	public enum cardsAndSets: String, CaseIterable {
		case cards = "cards"
		case sets = "sets"
		static var allValues = ["cards","sets"]
	}


