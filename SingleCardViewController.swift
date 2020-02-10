//
//  SingleCardViewController.swift
//  PokemonCards
//
//  Created by Siva Binjinepally on 2/1/20.
//  Copyright © 2020 Siva Binjinepally. All rights reserved.
//

import UIKit
import  Alamofire
class SingleCardViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		0
	}
	
	@IBOutlet weak var image: UIImageView!
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}
	
	@IBOutlet weak var tableView: UITableView!
	var card: Card?
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		Alamofire.request(card?.imageURL ?? "").response { ( response) in
			guard let data = response.data else {return}
			self.image.image = UIImage(data: data, scale:1)
		}
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
