//
//  CategoriesTableViewCell.swift
//  blackstarWear
//
//  Created by gleba on 16.05.2022.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet var categoryName: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
