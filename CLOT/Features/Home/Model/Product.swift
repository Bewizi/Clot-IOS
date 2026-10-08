//
//  Products.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import Foundation

struct Product {
    let name: String
    let category: String
    let image: String
    let description: String?
    let price: Double
}

let allProducts: [Product] = [
    
//    hoodies
    Product(
        name: "Men's Fleece Pullover Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 100
    ),
    
    Product(
        name: "Fleece Pullover Skate Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 159.97
    ),
    
    Product(
        name: "Fleece Skate Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 110
    ),
    
    Product(
        name: "Men's Ice-Dye Pullover Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 128.97
    ),
    
    Product(
        name: "Men's Monogram Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 52.97
    ),
    
//    shorts
    Product(
        name: "Classic Shorts",
        category: "Shorts",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    ),
    
//    accessories
    Product(
        name: "Accessories",
        category: "Accessories",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    ),
    
    //    shoes
    Product(
        name: "Shoes",
        category: "Shoes",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    ),
    
    //   bags
    Product(
        name: "Classic Bags",
        category: "Bag",
        image: "HarringtonJacket",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    )
]
