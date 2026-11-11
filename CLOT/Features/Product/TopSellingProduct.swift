//
//  TopSellingProduct.swift
//  CLOT
//
//  Created by Toluwalase on 11/11/2026.
//

import SwiftUI

struct TopSellingProduct: View {
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    let products: [Product]
    
    private var topSellingProducts: [Product] {
        products.filter{$0.status == "topSelling"}
    }
    
    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            
            ScrollView(showsIndicators: false){
                LazyVGrid(columns: columns, spacing: 12){
                    ForEach(topSellingProducts) { product in
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
    TopSellingProduct(products: allProducts.filter { $0.status == "topSelling" })
}
