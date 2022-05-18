//
//  SubCategoriesTableViewCell.swift
//  blackstarWear
//
//  Created by gleba on 17.05.2022.
//

import UIKit

class SubCategoriesTableViewCell: UITableViewCell {

    @IBOutlet var subCategoryName: UILabel!
    @IBOutlet var subImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
