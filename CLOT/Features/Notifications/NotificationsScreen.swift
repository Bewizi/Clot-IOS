//
//  NotificationsScreen.swift
//  CLOT
//
//  Created by Toluwalase on 30/09/2026.
//

import SwiftUI

struct NotificationsScreen: View {
    
    var notifications: [NotificationItem] = [
        NotificationItem(
            message: "Gilbert, you placed an order check your order history for full details",
            isUnread: true
        ),
        NotificationItem(
            message: "Gilbert, Thank you for shopping with us we have canceled order #24568.",
            isUnread: false
        ),
        NotificationItem(
            message: "Gilbert, your Order #24568 has been confirmed check your order history for f...",
            isUnread: false
        )
    ]
    //    @State var isEmpty: Bool = true
    
    
    var body: some View {
        VStack{
            AppText(title: "Notifications", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                .padding(.top, 20)
            
            VStack {
                if notifications.isEmpty {
                    Image("bell 1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(.bottom, 24)
                    AppText(title: "No Notification yet", fontSize: 24, textColor: .shadowGrey900, fontWeight: .medium)
                    Button{}label: {
                        AppText(title: "Explore Categories", fontSize: 16, textColor: .white, fontWeight: .regular)
                    }
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(.mediumSlateBlue300)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                    .padding(.top, 24)
                }else{
                    ScrollView(showsIndicators: false){
                        VStack(spacing: 12){
                            ForEach(notifications) { notification in
                                NotificationCardView(notification: notification)
                            }
                            
                        }
                    }
                    .padding(.top, 40)
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
    NotificationsScreen()
}

