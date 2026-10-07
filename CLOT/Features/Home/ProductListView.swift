//
//  ProductListView.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import SwiftUI

struct ProductListView: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let products: [Product]
//    = [
//        Product(
//               name: "Men's Fleece Pullover Hoodie",
//               category: "Hoodies",
//               image: "HarringtonJacket",
//               price: 100
//           ),
//        Product(
//               name: "Fleece Pullover Skate Hoodie",
//               category: "Hoodies",
//               image: "HarringtonJacket",
//               price: 150.97
//           ),
//        Product(
//               name: "Fleece Skate Hoodie",
//               category: "Hoodies",
//               image: "HarringtonJacket",
//               price: 110
//           ),
//        
//        Product(
//               name: "Classic Shorts",
//               category: "Shorts",
//               image: "shorts",
//               price: 60
//           )
//    ]
    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            
            AppText(title: "\(products.first?.category ?? "Products")", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                .padding(.top, 16)
                .padding(.bottom, 20)
            
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 12){
                    ForEach(products, id: \.name) { product in
                        ProductsCard(product: product)
                    }
                    
                }
            }
            
        }
        .padding(.horizontal, 24)
        .background(.midnightViolet900)
    }
}

#Preview {
    ProductListView(products: [Product(name: "Fleece Skate Hoodie", category: "Hoodies", image: "HarringtonJacket", price: 110)])
}
