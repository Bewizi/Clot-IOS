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
    let gender: String
    let description: String?
    let price: Double
}

let allProducts: [Product] = [
    
//    hoodies
    Product(
        name: "Men's Fleece Pullover Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 100
    ),
    
    Product(
        name: "Oversized hoodie with large print in brown",
        category: "Hoodies",
        image: "oversized hoodie with large print in brown",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 159.97
    ),
    
    Product(
        name: "Fleece Skate Hoodie",
        category: "Hoodies",
        image: "ali-saadat",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 110
    ),
    
    Product(
        name: "Hollister boxy fit hoodie in black",
        category: "Hoodies",
        image: "Hollister boxy fit hoodie in black",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 128.97
    ),
    
    Product(
        name: "Cotton On box fit hoodie in slate",
        category: "Hoodies",
        image: "Cotton On box fit hoodie in slate",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 52.97
    ),
    
//    shorts
    Product(
        name: "Jack & Jones lounge shorts in black",
        category: "Shorts",
        image: "Jack & Jones lounge shorts in black",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    ),
    
    Product(
        name: "4505 Icon 5 inch quick dry training shorts with zip pockets in caper",
        category: "Shorts",
        image: "5 inch quick dry training shorts with zip pockets in caper",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 34
    ),
    
//    accessories
    Product(
        name: "Accessories",
        category: "Accessories",
        image: "HarringtonJacket",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    ),

    //    shoes
    Product(
        name: "Shoes",
        category: "Shoes",
        image: "HarringtonJacket",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    ),
    
    //   bags
    Product(
        name: "Classic Bags",
        category: "Bag",
        image: "HarringtonJacket",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60
    )
]
