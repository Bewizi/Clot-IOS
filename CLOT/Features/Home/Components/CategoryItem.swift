//
//  CategoryItem.swift
//  CLOT
//
//  Created by Toluwalase on 29/09/2026.
//

import Foundation

struct CategoryItem: Identifiable{
   let id = UUID()
    let name: String
    let imageName: String
}

let categories: [CategoryItem] = [
    CategoryItem(name: "Hoodies", imageName: "hoodies"),
    CategoryItem(name: "Shorts", imageName: "shorts"),
    CategoryItem(name: "Shoes", imageName: "shoes"),
    CategoryItem(name: "Bag", imageName: "bag"),
    CategoryItem(name: "Accessories", imageName: "accessories")
    
]
