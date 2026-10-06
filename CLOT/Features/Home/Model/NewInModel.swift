//
//  NewInProduct.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import Foundation

struct NewInModel : Identifiable{
    let id: Int
    let image: String
    let productName: String
    let price: String
}


struct NewInMock {
    static let sampleNewInModel = NewInModel(
        id: 001,
        image: "HarringtonJacket",
        productName: "Nike Unscripted",
        price: "$120.00"
    )
    static let sampleNewInTwo = NewInModel(
        id: 002,
        image: "HarringtonJacket",
        productName: "Nike SB",
        price: "$100.00"
    )
    static let sampleNewInThree = NewInModel(
        id: 003,
        image: "HarringtonJacket",
        productName: "Nike Windrunner",
        price: "$52.97"
    )
    
    static let newIn = [
        sampleNewInModel,
        sampleNewInTwo,
        sampleNewInThree
    ]
}
