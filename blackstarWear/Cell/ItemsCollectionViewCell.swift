//
//  ItemsCollectionViewCell.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit
protocol BuyItemDelegate: AnyObject{
    func buyItem(index: Int)
}
class ItemsCollectionViewCell: UICollectionViewCell {
    var delegate: BuyItemDelegate?
    var itemsIndex = 0
    @IBAction func buyItem(_ sender: Any) {
        delegate?.buyItem(index: self.itemsIndex)
    }
    func getInfo(index: Int){
        self.itemsIndex = index
    }
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = buyButton.frame.height/2
        buyButton.titleLabel?.adjustsFontSizeToFitWidth = true
        buyButton.titleLabel?.minimumScaleFactor = 0.5
    }
}
