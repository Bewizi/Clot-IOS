//
//  Orders.swift
//  CLOT
//
//  Created by Toluwalase on 30/09/2026.
//

import SwiftUI

struct Orders: View {
    let orders: [OrderItems] = [
        OrderItems(orderId: "Order  #456765", orderItems: "4 items"),
        OrderItems(orderId: "Order  #456569", orderItems: "2 items"),
        OrderItems(orderId: "Order  #454809", orderItems: "1 items")
    ]
    
    var isEmpty = false
    var body: some View {
        VStack{
            AppText(title: "Orders", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                .padding(.top, 20)
            
            VStack {
                if isEmpty{
                    Image("check-out 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.bottom, 24)
                    AppText(title: "No Orders yet", fontSize: 24, textColor: .shadowGrey900, fontWeight: .medium)
                    Button{}label: {
                        AppText(title: "Explore Categories", fontSize: 16, textColor: .white, fontWeight: .regular)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(.mediumSlateBlue300)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top, 24)
                }else{
                    OrderStatusFilterBar(selectedStatus: .constant("Processing"))
                        .padding(.top, 40)
                    
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 12){
                            ForEach(orders){
                                order in
                                OrderListView(order: order)
                            }
                        }
                    }
                    .padding(.top, 24)
                }
                
                
                
            }
            .padding(.horizontal, 24)
            .frame(maxHeight: .infinity)
            .background(.midnightViolet900)
            
        }
        .frame(maxWidth:.infinity, )
        .background(.midnightViolet900)
    
    }
}

#Preview {
    Orders()
}
