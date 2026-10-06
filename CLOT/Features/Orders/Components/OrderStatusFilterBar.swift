//
//  OrderStatusFilterBar.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import SwiftUI

struct OrderStatusFilterBar: View {
    
    let statuses = [
        "Processing",
        "Shipped",
        "Delivered",
        "Returned",
        "Canceled"
    ]
    
    @Binding var selectedStatus: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(statuses, id: \.self){
                    status in
                    
                    Button(action: {
                        selectedStatus = status
                    }){
                        OrderStatus(text: status,
                                    isSelected: selectedStatus == status
                        )
                    }
                    
                }
            }
            
        }
        
    }
}

struct OrderStatus:View {
    let text:String
    let isSelected: Bool
    var body: some View {
        VStack{
            AppText(title: text,fontSize: 12, textColor: isSelected ? .white : .shadowGrey900,
                    fontWeight: isSelected ? .semibold : .medium)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(isSelected ? Color.shadowGrey800:  Color.whiteSmoke50)
        .clipShape(Capsule())
    }
}

#Preview {
    OrderStatusFilterBar(selectedStatus: .constant("Processing"))
}
