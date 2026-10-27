//
//  Profile.swift
//  CLOT
//
//  Created by Toluwalase on 30/09/2026.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        AppText(title: "Gilbert Jones", fontSize: 16, fontWeight: .bold)
                        AppText(title: "Glbertjones001@gmail.com")
                    }
                    Spacer()
                    Button{}label: {
                        AppText(title: "Edit", fontSize: 12,textColor: .mediumSlateBlue300, fontWeight: .bold, )
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 13)
                .background(.whiteSmoke50)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.bottom, 26)
            }
            
            VStack(alignment: .leading, spacing: 8){
                ProfileMenuTile(title: "Address", destination:
                                    AddressMethodScreen(onSaved: {})
                    .navigationBarBackButtonHidden()
                )
                
                ProfileMenuTile(title: "Wishlist", destination: WishlistScreen().navigationBarBackButtonHidden())
                
                ProfileMenuTile(title: "Payment", destination: PaymentMethodScreen(onSaved: {})
                    .navigationBarBackButtonHidden()
                )
                
                ProfileMenuTile(title: "Help", destination: Text("Address"))
                
                ProfileMenuTile(title: "Support", destination: Text("Address"))
            }
            
            VStack{
                Button{}label: {
                    AppText(title: "Sign Out", fontSize: 16, textColor: .cinnabar400, fontWeight: .bold)
                }
            }
            .padding(.top, 35)
        }
        .padding(.horizontal, 24)
        .padding(.top, 40)
        .frame(maxHeight: .infinity, alignment: .top)
        .background(.midnightViolet900)
    }
}

struct ProfileMenuTile<Destination: View>: View {
    var title: String
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination){
            HStack{
                AppText(title: title, fontSize: 16, )
                
                Spacer()
                
                Image("arrowright2")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.shadowGrey900)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 19)
            .background(.whiteSmoke50)
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
    
}

#Preview {
    Profile()
}
