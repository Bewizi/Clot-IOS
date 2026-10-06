//
//  NewInVIew.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import SwiftUI

struct NewInView: View {
    let products: [NewInModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                AppText(title: "New In", fontSize: 16, textColor: .mediumSlateBlue300, fontWeight: .bold)
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    AppText(title: "See All", fontSize: 16, textColor: .shadowGrey900, fontWeight: .regular)
                }
            }
            .padding(.bottom, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(products) { product in
                        ProductCard(product: product)
                            
                    }
                }
            }
        }
    }
}

private struct ProductCard: View {
    let product: NewInModel

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
                AppText(title: product.productName, fontSize: 12, textColor: .shadowGrey900, fontWeight: .regular)
                AppText(title: product.price, fontSize: 12, textColor: .shadowGrey900, fontWeight: .bold)
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
    NewInView(products: NewInMock.newIn)
}

