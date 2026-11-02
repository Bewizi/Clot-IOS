//
//  TopSellingModel.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import Foundation

struct TopSellingModel : Identifiable{
    let id: Int
    let image: String
    let productName: String
    let gender: String
    let price: String
}


struct TopSellingMock {
    static let sampleTopSellingModel = TopSellingModel(
        id: 001,
        image: "HarringtonJacket",
        productName: "Men's Harrington Jacket",
        gender: "male",
        price: "$148.00"
    )
    static let sampleTopSellingModelTwo = TopSellingModel(
        id: 002,
        image: "HarringtonJacket",
        productName: "Max Cirro Men's Slides",
        gender: "male",
        price: "$55.00"
    )
    static let sampleTopSellingModelThree = TopSellingModel(
        id: 003,
        image: "HarringtonJacket",
        productName: "Men's Coaches Jacket",
        gender: "male",
        price: "$66.97"
    )
    
    static let topSelling = [
        sampleTopSellingModel,
        sampleTopSellingModelTwo,
        sampleTopSellingModelThree
    ]
}
