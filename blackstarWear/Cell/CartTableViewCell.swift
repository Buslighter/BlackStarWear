//
//  CartTableViewCell.swift
//  blackstarWear
//
//  Created by gleba on 30.05.2022.
//

import UIKit

protocol CartViewCellDelegate: AnyObject{
    func deleteButton(index: Int)
}

class CartTableViewCell: UITableViewCell {
    var delegate: CartViewCellDelegate?
    @IBOutlet var deleteButtonOutlet: UIButton!
    var index = 0
    @IBAction func deleteButton(_ sender: Any) {
        delegate?.deleteButton(index: self.index)
    }
    func getIndex(index: Int){
        self.index = index
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

