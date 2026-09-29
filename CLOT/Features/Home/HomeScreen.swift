//
//  HomeScreen.swift
//  CLOT
//
//  Created by Toluwalase on 29/09/2026.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var searchItems = ""
    
//    let category: CategoryItem
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack{
                
                Menu {
                    Button("Men"){}
                    Button("Women"){}
                }label: {
                    
                    HStack(spacing: 4){
                        
                        AppText(title: "Men", fontSize: 12, textColor: .shadowGrey900, fontWeight: .bold)
                        
                        Image("arrowdown2")
                            .renderingMode(.template)
                            .foregroundStyle(.shadowGrey900)
                            .foregroundStyle(.gray)
                    }
                }
                .padding()
                .background(.whiteSmoke50)
                .clipShape(RoundedRectangle(cornerRadius: 100))
                
                HStack{
                    Spacer()
                    
                    Image("bag2")
                        .padding()
                        .background(.mediumSlateBlue300)
                        .clipShape(Circle())
                    
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
                    Button{
                        
                    }label: {
                        AppText(title: "See All", fontSize: 16, textColor: .shadowGrey900, fontWeight: .regular)
                    }
                    
                }
                .padding(.bottom, 16)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach(categories){
                            category in
                            Button(action: {}){
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
            Spacer()
        }
        
        .padding(.top, 20)
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity)
        .background(.midnightViolet900)
        
        
    }
}

#Preview {
    HomeScreen()
}
