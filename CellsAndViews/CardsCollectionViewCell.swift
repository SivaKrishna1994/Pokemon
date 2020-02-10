//
//  CardsCollectionViewCell.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import UIKit
import Alamofire
class CardsCollectionViewCell: UICollectionViewCell {
	static var identifier: String{
		return String(describing: self)
	}

	@IBOutlet weak var cardsImageView: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
		cardsImageView.isUserInteractionEnabled = false
		
        // Initialization code
    }
	
	func loadImage(url:String){
		Alamofire.request(url).response { ( response) in
			guard let data = response.data else {return}
			self.cardsImageView.image = UIImage(data: data, scale:1)
		}
	}

}
