//
//  CartViewController.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import UIKit

class CartViewController: UIViewController {

    @IBOutlet var cartTableVIew: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


}
extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartTableViewCell
        cell.sizeLabel.text = "S"
        cell.nameLabel.text = "Худи BS Wear"
        cell.colorLabel.text = "BLue"
        cell.priceLabel.text = "2500 руб."
        cell.imageCart.image = UIImage(named: "image")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let frameTV = tableView.frame
        let h = frameTV.height/5
        return CGFloat(h)
    }
    
}
