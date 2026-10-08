//
//  CartScreen.swift
//  CLOT
//
//  Created by Toluwalase on 08/10/2026.
//

import SwiftUI

struct CartScreen: View {
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
            
            VStack(spacing: 24){
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
        }
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity)
        .background(.midnightViolet900)
        
    }
}

#Preview {
    CartScreen()
}
