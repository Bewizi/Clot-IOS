//
//  CartModel.swift
//  CLOT
//
//  Created by Toluwalase on 12/11/2026.
//

import Foundation
import Combine

struct CartModel: Codable, Identifiable{
    let id: String
    let userId: String?
    let productId: String
    let name: String
    let image: String
    let price: Double
    let size: String
    let color: String
    let category: String
    let quantity: Int
    
    enum CodingKeys: String, CodingKey{
        case id
        case userId = "user_id"
        case productId = "product_id"
        case name
        case image
        case price
        case size
        case color
        case category
        case quantity
    }
}

struct AddToCartRequest: Encodable {
    let productID: String
    let name: String
    let image: String
    let price: Double
    let size: String
    let color: String
    let category: String
    let quantity: Int

    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case name
        case image
        case price
        case size
        case color
        case category
        case quantity
    }
}
