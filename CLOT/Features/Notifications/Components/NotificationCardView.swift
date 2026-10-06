//
//  NotificationCardView.swift
//  CLOT
//
//  Created by Toluwalase on 06/10/2026.
//

import SwiftUI

struct NotificationItem: Identifiable{
    let id = UUID()
    let message:String
    let isUnread: Bool
}

struct NotificationCardView: View {
    
    let notification: NotificationItem
    
    var body: some View {
        
        HStack( spacing: 21){
            
//            icon
            ZStack(alignment:.topTrailing){
                Image("notificationbing")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                if notification.isUnread{
                    Circle()
                        .frame(width: 8, height: 8)
                        .foregroundStyle(.red)
                }
            }
            
//            text
            AppText(title: notification.message, fontSize: 12, textColor: .shadowGrey900, fontWeight: .medium, textAlignment: .leading)
                .lineLimit(2)
        }
        .padding(.vertical, 17)
        .padding(.horizontal, 37)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.whiteSmoke50)
        
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}

#Preview {
    NotificationCardView(notification: NotificationItem(message: "Gilbert, Thank you for shopping with us we\n have canceled order #24568.", isUnread: true))
}
