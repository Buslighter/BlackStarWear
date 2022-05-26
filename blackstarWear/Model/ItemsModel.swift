//
//  ItemsModel.swift
//  blackstarWear
//
//  Created by gleba on 20.05.2022.
//

import Foundation
class Items: Codable{
    let items:[String: Item]
}
class Item: Codable{
    let name: String
    let desctiption: String
    let colorName: String
    let mainImage: String
    let offers: [Offers]
    let price: String
}
class Offers: Codable{
    let size: String
    
}
