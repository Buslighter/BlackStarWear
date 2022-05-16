//
//  CategoriesModel.swift
//  bswearDegreeProject
//
//  Created by gleba on 15.05.2022.
//

import Foundation
// MARK: - CategoriesModel
class CategoriesModel: Codable {
    let name: String
    let sortOrder: SortOrder
    let image, iconImage, iconImageActive: String
    let subcategories: [Subcategory]

    init(name: String, sortOrder: SortOrder, image: String, iconImage: String, iconImageActive: String, subcategories: [Subcategory]) {
        self.name = name
        self.sortOrder = sortOrder
        self.image = image
        self.iconImage = iconImage
        self.iconImageActive = iconImageActive
        self.subcategories = subcategories
    }
}

enum SortOrder: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(SortOrder.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for SortOrder"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Subcategory
class Subcategory: Codable {
    let id: SortOrder
    let iconImage: String
    let sortOrder: SortOrder
    let name: String
    let type: TypeEnum

    init(id: SortOrder, iconImage: String, sortOrder: SortOrder, name: String, type: TypeEnum) {
        self.id = id
        self.iconImage = iconImage
        self.sortOrder = sortOrder
        self.name = name
        self.type = type
    }
}

enum TypeEnum: String, Codable {
    case category = "Category"
    case collection = "Collection"
}

typealias Results = [String: CategoriesModel]







////class CategoriesModel:Codable{
////    var results:[Results]
////}
////class Results:Codable{
////    var result:[String:InfoModel]
////}
//class CategoriesModel:Codable{
//    var name:String
//    var sortOrder:String
//    var image:String
//    var subcategories:[SubCategories]?
//}
//class SubCategories: Codable{
//    var id:String
//    var iconImage:String
////    var sortOrder:String
//    var name:String
//    var type:String
//}
