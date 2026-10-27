//
//  WishlistScreen.swift
//  CLOT
//
//  Created by Toluwalase on 27/10/2026.
//

import SwiftUI

struct WishlistScreen: View {
    var body: some View {
        VStack{
            
            ZStack{
                AppText(title: "Wishlist", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                
                HStack{
                    BackButton()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)
            
            VStack(spacing: 8){
                WishlistCategory(title: "My Favorite", amountOfProduct: "12 Products")
                WishlistCategory(title: "T-Shirts", amountOfProduct: "4 Products")
            }
            .padding(.top, 42)
            
        }
        .padding(.horizontal, 24)
        .padding(.top, 16)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.midnightViolet900)
    
    }
}

struct WishlistCategory: View {
    var title: String
    var amountOfProduct: String
    var body: some View {
        HStack{
            HStack(spacing: 12){
                Image("heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                VStack(alignment: .leading, spacing: 8){
                    AppText(title: title, fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                    AppText(title: amountOfProduct, fontSize: 12, textColor: .shadowGrey900.opacity(0.5))
                    
                }
            }
            
            Spacer()
           
            Image("arrowright2")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .background(.whiteSmoke50)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    WishlistScreen()
}
