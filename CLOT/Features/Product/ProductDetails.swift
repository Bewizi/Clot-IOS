//
//  ProductDetails.swift
//  CLOT
//
//  Created by Toluwalase on 08/10/2026.
//

import SwiftUI

struct ProductDetails: View {
    @State private var size = "S"
    @State private var colorName = "Red"
    @EnvironmentObject private var cart: CartStore
    private var selectedColor: Color {
        switch colorName { case "Orange": return .orange; case "Black": return .black; case "Yellow": return .yellow; case "Blue": return .blue; default: return .red }
    }
    @State private var quantity = 1
    
    let product: Product
    
    func increaseQuantity(){
        quantity += 1
    }
    
    func decreaseQuantity(){
        quantity = max(1, quantity - 1)
        
    }
    
    
    var body: some View {
        VStack{
            HStack{
                BackButton()
                Spacer()
                Image("heart")
                    .renderingMode(.template)
                    .resizable()
                    .foregroundStyle(.shadowGrey900)
                    .scaledToFit()
                    .frame(width: 24)
                    .padding()
                    .background(.whiteSmoke50)
                    .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 24){
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                VStack(alignment: .leading, spacing: 15){
                    AppText(title: product.name, fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                    AppText(title: "$\(String(product.price))", fontSize: 16, textColor: .mediumSlateBlue300, fontWeight: .bold)
                }
                
               
                
            }
        
            ScrollView(showsIndicators:false){
                VStack(spacing: 12){
                    //                size
                    HStack{
                        AppText(title: "Size", fontSize: 16, textColor: .shadowGrey900, fontWeight: .medium,)
                        Spacer()
                        
                        Menu {
                            Button("Small"){size = "S"}
                            Button("Medium"){size = "M"}
                            Button("Large"){size = "L"}
                            Button("ExtraLarge"){size = "XL"}
                            Button("XXtraLarge"){size = "2XL"}
                        }label: {
                            HStack(spacing: 29){
                                AppText(title: size, fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold, )
                                Image("arrowdown2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                        }
                        
                        
                    }
                    .padding()
                    .background(.whiteSmoke50)
                    .clipShape(Capsule())
                    
                    //                    color
                    HStack{
                        AppText(title: "Color", fontSize: 16, textColor: .shadowGrey900, fontWeight: .medium,)
                        Spacer()
                        
                        Menu {
                            Button("Orange"){colorName = "Orange"}
                            Button("Black"){colorName = "Black"}
                            Button("Red"){colorName = "Red"}
                            Button("Yellow"){colorName = "Yellow"}
                            Button("Blue"){colorName = "Blue"}
                        }label: {
                            HStack(spacing: 29){
                                Circle()
                                    .foregroundStyle(selectedColor)
                                    .frame(width: 16, height: 16)
                                Image("arrowdown2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24)
                            }
                        }
                        
                        
                    }
                    .padding()
                    .background(.whiteSmoke50)
                    .clipShape(Capsule())
                    
                    //                quality
                    HStack{
                        AppText(title: "Quantity", fontSize: 16, textColor: .shadowGrey900, fontWeight: .medium,)
                        Spacer()
                        
                        HStack(spacing: 23){
                            Button{
                                increaseQuantity()
                            }label: {
                                ZStack{
                                    
                                    Circle()
                                        .foregroundStyle(.mediumSlateBlue300)
                                        .frame(width: 40)
                                    
                                    Image("add")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24)
                                }
                            }
                            
                            
                            AppText(title: String(quantity), fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold, )
                            
                            Button{decreaseQuantity()}label: {
                                ZStack{
                                    
                                    Circle()
                                        .foregroundStyle(.mediumSlateBlue300)
                                        .frame(width: 40)
                                    
                                    Image("minus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24)
                                }
                            }
                            
                        }
                        
                        
                    }
                    .padding()
                    .background(.whiteSmoke50)
                    .clipShape(Capsule())
                    
                    
                }
                .padding(.top, 33)
                
                VStack(alignment: .leading){
                    if let description = product.description {
                        AppText(
                            title: description,
                            fontSize: 12,
                            textColor: .shadowGrey900.opacity(0.5),
                            fontWeight: .regular,
                            textAlignment: .leading
                        )
                        .lineHeight(.loose)
                    }
                }
                .padding(.top, 23)
            }
            
        }
        .padding(.horizontal, 24)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Button {
                cart.add(product: product, size: size, color: colorName, quantity: quantity)
            } label: {
                HStack {
                    AppText(
                        title: "$\(String(product.price))",
                        fontSize: 16,
                        textColor: .white,
                        fontWeight: .bold
                    )

                    Spacer()

                    AppText(
                        title: "Add to Bag",
                        fontSize: 16,
                        textColor: .white,
                        fontWeight: .medium
                    )
                }
                .padding(.horizontal, 24)
                
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                .background(.mediumSlateBlue300)
                .clipShape(Capsule())
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
            .background(.white)
        }
    }
}

#Preview {
    ProductDetails(product: Product(name: "Men's Fleece Pullover Hoodie", category: "Hoodies", image: "HarringtonJacket",description: "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.", price: 148.00))
        .environmentObject(CartStore())
}
