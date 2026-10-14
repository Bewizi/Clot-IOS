//
//  CartScreen.swift
//  CLOT
//
//  Created by Toluwalase on 08/10/2026.
//

import SwiftUI

struct CartScreen: View {
    @EnvironmentObject private var cart: CartStore
    var body: some View {
        VStack{
            
            ZStack{
                AppText(title: "Cart", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                
                HStack{
                    BackButton()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            
            
            if cart.items.isEmpty { VStack(spacing: 24){
                Image("parcel 1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                AppText(title: "Your Cart is Empty", fontSize: 24, textColor: .shadowGrey900, fontWeight: .medium)
                NavigationLink{
                    CategoryListView()
                        .navigationBarBackButtonHidden()
                }label: {
                    AppText(title: "Explore Categories", fontSize: 16, textColor: .white, fontWeight: .regular)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .background(.mediumSlateBlue300)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                
            }
            .frame(maxHeight: .infinity,)
            } else {
                VStack(alignment: .leading){
                    Button("Remove All", action: cart.removeAll)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(cart.items) { item in
                                CartItemRow(
                                    imageName: item.product.image,
                                    title: item.product.name,
                                    size: item.size,
                                    color: item.color,
                                    price: "$\(item.product.price * Double(item.quantity))",
                                    quantity: item.quantity,
                                    onIncrease: { cart.increase(item) },
                                    onDecrease: { cart.decrease(item) }
                                )
                            }
                            AppText(title: "Subtotal  $\(cart.subtotal)", fontWeight: .bold)
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity)
        .background(.midnightViolet900)
        
    }
}

#Preview {
    CartScreen().environmentObject(CartStore())
}
