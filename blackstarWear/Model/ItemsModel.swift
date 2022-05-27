//
//  ItemsModel.swift
//  blackstarWear
//
//  Created by gleba on 20.05.2022.
//

import Foundation
//class Items: Codable{
//    let items:[String: Item]
//}
class Item: Codable{
    let name: String
    let description: String?
    let colorName: String?
    let mainImage: String?
    let productImages: [ProductImages]?
    let offers: [Offers]?
    let price: String
}
class Offers: Codable{
    let size: String
    
}
class ProductImages: Codable{
    let imageURL: String?
}
typealias ItemResults = [String: Item]
