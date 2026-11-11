//
//  Products.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import Foundation


struct Product: Codable, Identifiable {
    let id: String
    let name: String
    let category: String
    let image: String
    let gender: String
    let description: String?
    let price: Double
    let status: String
}

struct ProductsResponse: Codable{
    let products: [Product]
}

struct ProductResponse: Codable{
    let product: Product
}

extension Product {
    static let placeholder = Product(
        id: "placeholder",
        name: "Product name",
        category: "Category",
        image: "",
        gender: "male",
        description: nil,
        price: 0,
        status: "newIn"
    )
}





let allProducts: [Product] = [
    
    //    hoodies
    Product(
        id: "preview-1",
        name: "Men's Fleece Pullover Hoodie",
        category: "Hoodies",
        image: "HarringtonJacket",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 100,
        status: "newIn"
    ),
    
    Product(
        id: "preview-2",
        name: "Oversized hoodie with large print in brown",
        category: "Hoodies",
        image: "oversized hoodie with large print in brown",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 159.97,
        status: "topSelling"
    ),
    
    Product(
        id: "preview-3",
        name: "Fleece Skate Hoodie",
        category: "Hoodies",
        image: "ali-saadat",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 110,
        status: "newIn"
    ),
    
    Product(
        id: "preview-4",
        name: "Hollister boxy fit hoodie in black",
        category: "Hoodies",
        image: "Hollister boxy fit hoodie in black",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 128.97,
        status: "topSelling"
    ),
    
    Product(
        id: "preview-5",
        name: "Cotton On box fit hoodie in slate",
        category: "Hoodies",
        image: "Cotton On box fit hoodie in slate",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 52.97,
        status: "newIn"
    ),
    
    Product(
        id: "preview-6",
        name: "ASOS DESIGN extreme oversized hoodie with back print in navy",
        category: "Hoodies",
        image: "extreme oversized hoodie with back print in navy",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 54.00,
        status: "topSelling"
    ),
    
    //    shorts
    Product(
        id: "preview-7",
        name: "Jack & Jones lounge shorts in black",
        category: "Shorts",
        image: "Jack & Jones lounge shorts in black",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60,
        status: "newIn"
    ),
    
    Product(
        id: "preview-8",
        name: "4505 Icon 5 inch quick dry training shorts with zip pockets in caper",
        category: "Shorts",
        image: "5 inch quick dry training shorts with zip pockets in caper",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 34,
        status: "newIn"
    ),
    
    //    accessories
    Product(
        id: "preview-9",
        name: "Accessories",
        category: "Accessories",
        image: "HarringtonJacket",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60,
        status: "newIn"
    ),
    
    //    shoes
    Product(
        id: "preview-10",
        name: "Shoes",
        category: "Shoes",
        image: "HarringtonJacket",
        gender: "male",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60,
        status: "newIn"
    ),
    
    //   bags
    Product(
        id: "preview-1",
        name: "Classic Bags",
        category: "Bag",
        image: "HarringtonJacket",
        gender: "female",
        description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
        price: 60,
        status: "newIn"
    )
]


