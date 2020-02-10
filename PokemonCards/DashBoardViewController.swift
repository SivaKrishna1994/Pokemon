//
//  DashBoardViewController.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 1/31/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

	
	
	@IBOutlet weak var tableView: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	var cardsArray: [Card]?
	var setsArray: [SetElement]?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setSearchBar()
		setTableView()
		dispatchGroup()
		var array = [0,2,7,6]
    lengthOfLongestString(value: "bbbbbbbb")
	}
	
	func dispatchGroup() {
		for type in cardsAndSets.allValues {
			switch type {
			case cardsAndSets.cards.rawValue:
				NetworkCallManager.sharedRequestDispatch.requestForDataWith(url: urlConstants.cardPagination,extraString: "1", completionHandler: {(result,singleResut, error)  in
					if error{
						
					}else {
						self.cardsArray = result as? [Card]
							self.tableView.reloadData()
					}
				})
			case cardsAndSets.sets.rawValue:
				NetworkCallManager.sharedRequestDispatch.requestForDataWith(url: urlConstants.sets, completionHandler: {(result,singleResult, error)  in
					if error{
						
					}else {
						self.setsArray = result as? [SetElement]
						self.tableView.reloadData()
						
					}
				})
			default:
				break
			}
		}
	}
	
	func setTableView(){
		tableView.delegate = self
		tableView.dataSource = self
		tableView.separatorStyle = .none
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableView.automaticDimension
		tableView.register(UINib(nibName: CardsTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: CardsTableViewCell.identifier)
	}
	
	func setSearchBar(){
		searchBar.delegate = self
		searchBar.placeholder = "Enter Pokemon Name"
			searchBar.searchBarStyle = .minimal
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame = searchBar.bounds
		gradientLayer.colors = [UIColor.red.cgColor, UIColor.red.cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
		gradientLayer.locations = [NSNumber(value: 0.0), NSNumber(value: 0.5), NSNumber(value: 0.5), NSNumber(value: 1.0)]
			self.searchBar.layer.insertSublayer(gradientLayer, at: 0)
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		return cardsAndSets.allValues.count
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableViewCell.identifier, for: indexPath) as! CardsTableViewCell
			cell.setcollectionCells(cards: cardsArray ?? [])
			cell.vc = self
			let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cardsButton))
			cell.buttonOut.addGestureRecognizer(tapGesture)
			cell.label.text = "Cards"
			return cell 
		case 1:
			let cell = tableView.dequeueReusableCell(withIdentifier: CardsTableViewCell.identifier, for: indexPath) as! CardsTableViewCell
			cell.setSets(sets: setsArray ?? [])
			let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setsButton))
			cell.buttonOut.addGestureRecognizer(tapGesture)
			cell.vc = self
			cell.label.text = "Sets"
			return cell 
		default:
			return UITableViewCell()
		}
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.present(SingleCardViewController(), animated: true, completion: nil)
	}
	
//	func move(){
//		var v: UINavigationController = UINavigationController(rootViewController: SingleCardTableViewController())
//		self.present(v, animated: false)
//	}
	func lengthOfLongestString(value:String) -> Int{
		var Value = 1
		var map:[Character:Int] = [Character:Int]()
		for c in value{
			if map[c] != nil{
				map.removeAll()
				Value = 1
			}else{
				map[c] = Value
				Value += 1
			}
		}
		return Value
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		let string = searchBar.text
		let vc = ViewAllCollectionViewController(nibName: String(describing: ViewAllCollectionViewController.self), bundle: Bundle(for: DashBoardViewController.self))
		vc.searchString = string
		self.navigationController?.pushViewController(vc, animated: true)
	}
	@objc func cardsButton(){
		let vc = ViewAllCollectionViewController(nibName: String(describing: ViewAllCollectionViewController.self), bundle: Bundle(for: DashBoardViewController.self))
		vc.cards = cardsArray
		self.navigationController?.pushViewController(vc, animated: false)
	}
	
	@objc func setsButton(){
		let vc = ViewAllCollectionViewController(nibName: String(describing: ViewAllCollectionViewController.self), bundle: Bundle(for: DashBoardViewController.self))
		vc.sets = setsArray
		self.navigationController?.pushViewController(vc, animated: false)
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		
	}
}

