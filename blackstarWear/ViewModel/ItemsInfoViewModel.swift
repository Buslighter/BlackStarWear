//
//  ItemsInfoViewModel.swift
//  blackstarWear
//
//  Created by gleba on 03.06.2022.
//

import UIKit
import RealmSwift
class ItemsInfoVM{
    func roundButton(button:UIButton) -> CGFloat{
        let cornerRadius = button.frame.width/2
        return cornerRadius
    }
    var itemsInfo = ItemsInfoModel()
    var realm = try! Realm()
    func addRealm(info: ItemsInfoVM, image: UIImage){
        let items = CartRealmModel()
        try! self.realm.write{
            items.price = info.itemsInfo.price
            items.name = info.itemsInfo.name
            items.imageData = image.jpegData(compressionQuality: 0.9)
            items.size = info.itemsInfo.currentSize
            items.color = info.itemsInfo.colorName
            self.realm.add(items)
        }
    }
}
