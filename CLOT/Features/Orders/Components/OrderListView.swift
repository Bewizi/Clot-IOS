//
//  OrderListView.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import SwiftUI

struct OrderItems: Identifiable{
    let id = UUID()
    let orderId:String
    let orderItems:String
}

struct OrderListView: View {
    
    let order: OrderItems
    
    var body: some View {
        HStack{
            HStack(spacing: 12 ){
                Image("receipt1")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.shadowGrey900)
                VStack(alignment: .leading, spacing: 8){
                    AppText(title: order.orderId, fontSize: 16, textColor: .shadowGrey900, fontWeight: .medium,)
                    AppText(title: order.orderItems, fontSize: 12, textColor: .shadowGrey900.opacity(0.5), fontWeight: .medium,)
                    
                }
            }
            Spacer()
            Image("arrowright2")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.shadowGrey900)
            
        }
        .padding(.vertical, 17)
        .padding(.horizontal, 37)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.whiteSmoke50)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    OrderListView(order: OrderItems(orderId: "Order  #456765", orderItems: "4 items"))
}
