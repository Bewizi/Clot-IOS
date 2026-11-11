//
//  ProductCard.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import SwiftUI

protocol ProductDisplayable: Identifiable {
    var displayName: String { get }
    var displayImageName: String { get }
    var displayPriceText: String { get }
}


// Conform Product
extension Product: ProductDisplayable {
//    var id: String { name } 
    var displayName: String { name }
    var displayImageName: String { image }
    var displayPriceText: String { String(format: "$%.2f", price) }
}

// Generic card
struct ProductsCard<Item: ProductDisplayable>: View {
    let product: Item
    @State private var isLiked = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .topTrailing) {
                Image(product.displayImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)

                Button { isLiked.toggle() } label: {
                    // your like UI
                    Image(isLiked ? "heart 2" : "heart")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(isLiked ? .red : .navColor900)
                        .padding(12)
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                AppText(title: product.displayName, fontSize: 12, textColor: .shadowGrey900, fontWeight: .regular, textAlignment: .leading)
                    .lineLimit(1)
                    .minimumScaleFactor(2)
                AppText(title: product.displayPriceText, fontSize: 12, textColor: .shadowGrey900, fontWeight: .bold)
            }
            .padding(.horizontal, 4)
            .padding(.top, 8)
            .padding(.bottom, 16)
        }
        .frame(maxWidth: 150, alignment: .center)
        .background(.whiteSmoke50)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


#Preview {
    ProductsCard(product:  Product(id: "preview-1", name: "ASOS DESIGN extreme oversized\n hoodie with back print in navy", category: "Hoodies", image: "HarringtonJacket", gender: "male", description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.", price: 100.00,status: "newIn"))
}
