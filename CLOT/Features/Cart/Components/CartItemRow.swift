//
//  CartItemRow.swift
//  CLOT
//
//  Created by Toluwalase on 14/10/2026.
//

import SwiftUI

struct CartItemRow: View {
    let imageName: String
    let title: String
    let size: String
    let color: String
    let price: String
    let quantity: Int
    let onIncrease: () -> Void
    let onDecrease: () -> Void
    var body: some View {
        HStack(spacing: 16) {
            // Product Image
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // Details & Attributes
            VStack(alignment: .leading, spacing: 12) {
                AppText(title: title, fontSize: 12, fontWeight: .semibold, textAlignment: .leading)
                    .fixedSize(horizontal: true, vertical: true)
                    .lineLimit(1)
                
                HStack(spacing: 12) {
                    Text("Size - **\(size)**")
                    Text("Color - **\(color)**")
                }
                .fixedSize(horizontal: true, vertical: true)
                .lineLimit(1)
                .font(.system(size: 13))
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            // Price & Quantity Stepper / Buttons
            VStack(alignment: .trailing, spacing: 12) {
                AppText(title: price, fontSize: 12, fontWeight: .bold, textAlignment: .leading)
                
                HStack(spacing: 8) {
                    Button(action: onIncrease) {
                        Image("add")
                            .frame(width: 28, height: 28)
                            .background(Color.mediumSlateBlue300)
                            .clipShape(Circle())
                    }
                    
                    Button(action: onDecrease) {
                        Image("minus")
                            .frame(width: 28, height: 28)
                            .background(Color.mediumSlateBlue300)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding(16)
        .background(Color.whiteSmoke50)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CartItemRow(
        imageName: "HarringtonJacket",
        title: "Men's Harrington Jacket",
        size: "M",
        color: "Lemon",
        price: "$148", quantity: 1, onIncrease: {}, onDecrease: {}
    )
}
