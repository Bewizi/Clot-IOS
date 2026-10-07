//
//  ProductCard.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import SwiftUI

struct ProductsCard: View {
    let product : Product
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                
                Image("heart")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(.shadowGrey900)
                    .padding(12)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                AppText(title: product.name, fontSize: 12, textColor: .shadowGrey900, fontWeight: .regular)
                AppText(title: String(format:"$%.2f", product.price), fontSize: 12, textColor: .shadowGrey900, fontWeight: .bold)
            }
            .padding(.horizontal, 4)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .background(.whiteSmoke50)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    ProductsCard(product:  Product(name: "Men's Fleece Pullover Hoodie", category: "Hoodies", image: "HarringtonJacket", price: 100.00))
}
