//
//  SetsCollectionViewCell.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 2/1/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import UIKit
import Alamofire

class SetsCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var image: UIImageView!
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
	static var identifier: String{
		return String(describing: self)
	}
	
	func loadImage(url:String,setName:String){
		Alamofire.request(url).response { ( response) in
			guard let data = response.data else {return}
			self.image.image = UIImage(data: data, scale:1)
			self.label.text = setName
		}
	}

}
