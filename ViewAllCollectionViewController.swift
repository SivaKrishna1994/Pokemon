//
//  ViewAllCollectionViewController.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 2/1/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ViewAllCollectionViewController: UICollectionViewController {
	var cards: [Card]?
	var sets: [SetElement]?
	var searchString: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		collectionView.register(UINib(nibName: SetsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SetsCollectionViewCell.identifier)
		if let search = searchString{
			NetworkCallManager.sharedRequestDispatch.requestForDataWith(url: .cardWithName, extraString: search, completionHandler: {(result,singleResult,error) in
				if error{
					
				}else{
					self.cards = result as? [Card]
					self.collectionView.reloadData()
				}
				
			})
		}
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
		flowLayout.estimatedItemSize = CGSize(width: 200, height: 300)
		 }
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let size = (collectionView.frame.size.width - 30) / 2
		return CGSize(width: size, height: size)
	}
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		if cards != nil{
			return cards?.count ?? 0
		}else{
			return sets?.count ?? 0
		}
		
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
	let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetsCollectionViewCell.identifier, for: indexPath) as! SetsCollectionViewCell
		if cards != nil{
			cell.loadImage(url: cards?[indexPath.row].imageURL ?? "", setName: cards?[indexPath.row].name ?? "")
		}else {
			cell.loadImage(url: sets?[indexPath.row].logoURL ?? "", setName: sets?[indexPath.row].name ?? "")
		}
    
        return cell
    }

  
    
}
