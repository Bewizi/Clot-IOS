//
//  HomeScreen.swift
//  CLOT
//
//  Created by Toluwalase on 29/09/2026.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var searchItems = ""
    @Binding var selectedGender: String

    private var genderLabel: String {
        selectedGender == "male" ? "Men" : "Women"
    }

    private var selectedProducts: [Product] {
        allProducts.filter { $0.gender == selectedGender }
    }
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                
                Menu {
                    Button("Men"){
                        selectedGender = "male"
                    }
                    Button("Women"){
                        selectedGender = "female"
                    }
                }label: {
                    
                    HStack(spacing: 4){
                        
                        AppText(title: genderLabel, fontSize: 12, textColor: .shadowGrey900, fontWeight: .bold)
                        
                        Image("arrowdown2")
                            .renderingMode(.template)
                            .foregroundStyle(.shadowGrey900)
                    }
                }
                .padding()
                .background(.whiteSmoke50)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                
                HStack{
                    Spacer()
                    NavigationLink{
                        CartScreen()
                            .navigationBarBackButtonHidden()
                    }label: {
                        Image("bag2")
                            .padding()
                            .background(.mediumSlateBlue300)
                            .clipShape(Circle())
                    }
                    
                    
                }
                
            }
            .padding(.bottom, 24)
            
            ZStack(alignment: .leading) {
                if searchItems.isEmpty {
                    HStack {
                        Image( "searchnormal1")
                            .renderingMode(.template)
                            .foregroundStyle(.shadowGrey900)

                        AppText(title: "Search", fontSize: 12, textColor: .shadowGrey900, fontWeight: .semibold)
                            .foregroundStyle(.shadowGrey900)
                    }
                    .padding(.horizontal, 16)
                }

                TextField("", text: $searchItems)
                    .padding(.horizontal, 16)
            }
            .padding(.vertical, 10)
            .background(.whiteSmoke50)
            .clipShape(RoundedRectangle(cornerRadius: 100))
            .padding(.bottom, 24)
            
//            all categories
            VStack{
                HStack{
                    AppText(title: "Categories", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                    Spacer()
                    NavigationLink {
                        CategoryListView(selectedGender: $selectedGender)
                            .navigationBarBackButtonHidden()
                    } label: {
                        AppText(title: "See All", fontSize: 16, textColor: .shadowGrey900, fontWeight: .regular)
                    }
                    
                }
                .padding(.bottom, 16)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach(categories){
                            category in
                            NavigationLink {
                                ProductListView(products: selectedProducts.filter {
                                    $0.category == category.name
                                })
                                .navigationBarBackButtonHidden()
                            } label: {
                                VStack(spacing: 5){
                                    Image(category.imageName)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                    AppText(title: category.name, fontSize: 12, textColor: .shadowGrey900, fontWeight: .regular)
                                        
                                }
                            }
                        }
                    }
                }
            }
            .padding(.bottom, 24)
            
            ScrollView(showsIndicators:false){
                VStack(alignment: .leading, spacing: 24){
                    TopSelling(products: TopSellingMock.topSelling)
                        
                    
                    NewInView(products: NewInMock.newIn)
                }
            }
        }
        
        .padding(.top, 20)
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity)
        .background(.midnightViolet900)
    }
}

#Preview {
    HomeScreen(selectedGender: .constant("male"))
}

