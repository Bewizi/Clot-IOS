//
//  CategoryListView.swift
//  CLOT
//
//  Created by Toluwalase on 29/09/2026.
//

import SwiftUI

struct CategoryListView: View {
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            
            AppText(title: "Shop by Categories", fontSize: 24, textColor: .shadowGrey900, fontWeight: .bold)
            
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading, spacing: 8){
                    ForEach(categories){
                        category in
                        Button(action: {}){
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
    }
}

struct BackButton:View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button{
            dismiss()
        }label: {
            Image("arrowleft2")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(.shadowGrey900)
                .scaledToFit()
                .frame(width: 24)
                .padding()
                .background(.whiteSmoke50)
                .clipShape(Circle())
                
        }
        
        
    }
}

#Preview {
    CategoryListView()
}
