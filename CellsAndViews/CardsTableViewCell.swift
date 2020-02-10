//
//  CardsTableViewCell.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import UIKit


class CardsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

	static var identifier: String {
        return String(describing: self)
    }
	
	var section: cardsAndSets = .cards
	var cardsToBeFilled: [Card]?
	var setsToBeFillers : [SetElement]?
	var vc:DashBoardViewController!
	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var collectionVIew: UICollectionView!

	@IBOutlet weak var buttonOut: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
		collectionVIew.delegate = self
		collectionVIew.dataSource = self
		collectionVIew.isPagingEnabled = true
		self.contentView.isUserInteractionEnabled = true
		if let flowLayout = collectionVIew?.collectionViewLayout as? UICollectionViewFlowLayout {
			flowLayout.estimatedItemSize = CGSize(width: 200, height: 300)
			 }
		collectionVIew.register(UINib(nibName: CardsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CardsCollectionViewCell.identifier)
		collectionVIew.register(UINib(nibName: SetsCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SetsCollectionViewCell.identifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		switch indexPath.row {
		case 0:
			guard let id = cardsToBeFilled?[indexPath.section].id else { return }
		NetworkCallManager.sharedRequestDispatch.requestForDataWith(url:.cardsWithNameId,extraString: String(id) ?? "",completionHandler: {
			result, singleResult,error  in
			if error{
				
			}else{
			var card = singleResult as? singleCard
				let vc = SingleCardViewController(nibName: String(describing: SingleCardViewController.self), bundle: Bundle(for: CardsTableViewCell.self))
				vc.card = card?.card
				self.vc.navigationController?.pushViewController(vc, animated: false)
				
				}
			})
		default:
			break
		}
	}
	
	
	func topMostController() -> UIViewController {
		var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
		while (topController.presentedViewController != nil) {
			topController = topController.presentedViewController!
		}
		return topController
	}
	
	func setcollectionCells(cards: [Card] = []){
		section = .cards
		cardsToBeFilled = cards
		collectionVIew.reloadData()
	}
	
	func setSets(sets: [SetElement] = [])  {
		section = .sets
		setsToBeFillers = sets
		collectionVIew.reloadData()
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		switch section {
		case .cards:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsCollectionViewCell.identifier, for: indexPath) as! CardsCollectionViewCell
			cell.loadImage(url: cardsToBeFilled?[indexPath.section].imageURL ?? "")
			return cell
		case .sets:
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetsCollectionViewCell.identifier, for: indexPath) as! SetsCollectionViewCell
			cell.loadImage(url: setsToBeFillers?[indexPath.section].logoURL ?? "", setName: setsToBeFillers?[indexPath.section].name ?? "")
			return cell
		}
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		switch section {
		case .cards:
			return cardsToBeFilled?.count ?? 0
		case .sets:
			return setsToBeFillers?.count ?? 0
		}
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}
    
}
