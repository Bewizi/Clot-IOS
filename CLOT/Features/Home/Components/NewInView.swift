//
//  NewInVIew.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import SwiftUI

struct NewInView: View {
    let products: [Product]
    let isLoading: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                AppText(title: "New In", fontSize: 16, textColor: .mediumSlateBlue300, fontWeight: .bold)
                Spacer()
                NavigationLink {
                    NewInSellingProduct(products: products)
                        .navigationBarBackButtonHidden()
                }
                
                label: {
                    AppText(title: "See All", fontSize: 16, textColor: .shadowGrey900, fontWeight: .regular)
                }
            }
            .padding(.bottom, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(products) { product in
                        
                        NavigationLink{
                            ProductDetails(product: product)
                                .navigationBarBackButtonHidden()
                        }label: {
                            ProductsCard(product: product, isLoading: isLoading)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewInView(products: allProducts.filter { $0.status == "newIn" }, isLoading: true)
}

