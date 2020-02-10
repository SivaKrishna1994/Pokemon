//
//  NetworkcallManager.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import Foundation
import Alamofire

public class NetworkCallManager{
	
	static let sharedRequestDispatch = NetworkCallManager()
	func requestForDataWith(url:urlConstants = .cardPagination,extraString: String = "", completionHandler: @escaping (_ result: [AnyObject] , _ singleResult: AnyObject , _ error: Bool) -> Void){
		
		let completeurl = urlConstants.baseUrl.rawValue + url.rawValue + extraString
		Alamofire.request(completeurl).response{ response in
			guard let data = response.data else{return}
			do{
				let decoder = JSONDecoder()
				switch url{
				case .cardPagination:
					let cardResult = try decoder.decode(Cards.self, from: data)
					completionHandler(cardResult.cards ?? [],Card(),false)
				case .sets:
					let setResult = try decoder.decode(Sets.self, from: data)
					completionHandler(setResult.sets ?? [] as [AnyObject],SetElement(),false)
				case .cardsWithNameId:
					let card = try decoder.decode(singleCard.self, from: data)
					completionHandler([],card,false)
				case .cardWithName:
					let cardResult = try decoder.decode(Cards.self, from: data)
					completionHandler(cardResult.cards ?? [],Card(),false)
				default:
					break
				}
				
			}catch let error {
				print(error)
			}
		}
	}
}


