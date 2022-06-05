//
//  CartViewController.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import UIKit

class CartViewController: UIViewController {
    var cartVM = CartViewModel()
    @IBOutlet var cartTableVIew: UITableView!
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var sumLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButton.layer.cornerRadius = buyButton.frame.height/2
    }
}
extension CartViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        sumLabel.text = cartVM.sumPrices()
        return cartVM.realmResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell") as! CartTableViewCell
        let items = cartVM.realmResults
        cell.sizeLabel.text = items[indexPath.row].size
        cell.nameLabel.text = items[indexPath.row].name
        cell.colorLabel.text = items[indexPath.row].color
        cell.priceLabel.text = makeRightPrice(price: items[indexPath.row].price ?? "0")
        cell.imageCart.image = UIImage(data: items[indexPath.row].imageData ?? Data())
        cell.getIndex(index: indexPath.row)
        cell.delegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let frameTV = tableView.frame
        let h = frameTV.height/5
        return CGFloat(h)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
extension CartViewController: CartViewCellDelegate{
    func deleteButton(index: Int) {
        present(cartVM.deleteRealm(id: index,tableView: cartTableVIew), animated: true,completion: nil)
    }
    
    
}
