//
//  Product.swift
//  OnlineShopping
//
//  Created by Mert Gürcan on 12.12.2020.
//

import Foundation

// MARK: - ProductElement
class ProductElement: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: Category
    let image: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case description
        case category
        case image
    }

    init(id: Int, title: String, price: Double, description: String, category: Category, image: String) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.image = image
    }
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menClothing = "men clothing"
    case womenClothing = "women clothing"
}

typealias Product = [ProductElement]
