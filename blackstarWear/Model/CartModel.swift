//
//  CartModel.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import Foundation
import RealmSwift
class CartRealmModel: Object{
    @objc dynamic var name: String?
    @objc dynamic var size: String?
    @objc dynamic var color: String?
    @objc dynamic var price: String?
    @objc dynamic var imageData: Data?
}
