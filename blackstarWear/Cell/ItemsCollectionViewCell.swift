//
//  ItemsCollectionViewCell.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    
    @IBAction func buyItem(_ sender: Any) {
    }
    @IBOutlet var buyButton: UIButton!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var itemImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buyButton.layer.cornerRadius = buyButton.frame.height/2
    }
}
