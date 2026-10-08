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

    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            
            AppText(title: "\(products.first?.category ?? "Products") (\(products.count))", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                .padding(.top, 16)
                .padding(.bottom, 20)
            
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 12){
                    ForEach(products, id: \.name) { product in
                        NavigationLink{
                            ProductDetails(product: product)
                                .navigationBarBackButtonHidden()
                        }label: {
                            ProductsCard(product: product)
                        }
                    }
                    
                }
            }
            
        }
        .padding(.horizontal, 24)
        .background(.midnightViolet900)
    }
}

#Preview {
    ProductListView(products: [Product(name: "Fleece Skate Hoodie", category: "Hoodies", image: "HarringtonJacket", description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.", price: 110)])
}
