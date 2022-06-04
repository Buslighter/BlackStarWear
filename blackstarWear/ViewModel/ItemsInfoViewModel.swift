//
//  ItemsInfoViewModel.swift
//  blackstarWear
//
//  Created by gleba on 03.06.2022.
//

import UIKit
import Realm
class ItemsInfoVM{
    func roundButton(button:UIButton) -> CGFloat{
        let cornerRadius = button.frame.width/2
        return cornerRadius
    }
    var itemsInfo = ItemsInfoModel()
    
}
