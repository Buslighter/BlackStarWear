//
//  CartTableViewCell.swift
//  blackstarWear
//
//  Created by gleba on 30.05.2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBAction func deleteButton(_ sender: Any) {
    }
    @IBOutlet var colorLabel: UILabel!
    @IBOutlet var sizeLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageCart: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
