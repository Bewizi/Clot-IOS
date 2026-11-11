//
//  CategoryListView.swift
//  CLOT
//
//  Created by Toluwalase on 29/09/2026.
//

import SwiftUI

struct CategoryListView: View {
    @Binding var selectedGender: String
    @StateObject private var viewModel = ProductViewModel()
    
    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            
            AppText(title: "Shop by Categories", fontSize: 24, textColor: .shadowGrey900, fontWeight: .bold)
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 8){
                    ForEach(categories){
                        category in
                        NavigationLink{
                            ProductListView(products: viewModel.products.filter {
                                $0.gender == selectedGender && $0.category == category.name
                            }
                            )
                            .navigationBarBackButtonHidden()
                        }label: {
                            HStack(spacing: 16){
                                Image(category.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50,)
                                AppText(title: category.name, fontSize: 16, textColor: .shadowGrey900, fontWeight: .medium)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(16)
                            
                            .background(.whiteSmoke50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 24)
        .background(.midnightViolet900)
        .task {
            await viewModel.fetchAllProduct()
        }
    }
}

#Preview {
    CategoryListView(selectedGender: .constant("male"))
}
