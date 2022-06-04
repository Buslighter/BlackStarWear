//
//  ItemsInfoTableViewCell.swift
//  blackstarWear
//
//  Created by gleba on 02.06.2022.
//

import UIKit

class ItemsInfoTableViewCell: UITableViewCell {

    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var checkMarkImage: UIImageView!
    @IBOutlet var colorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class ItemsInfoImageCell: UICollectionViewCell {
    
    @IBOutlet var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
