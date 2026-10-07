//
//  NavigationBar.swift
//  CLOT
//
//  Created by Toluwalase on 05/10/2026.
//

import SwiftUI

struct NavigationBar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                
                // Content
                Group {
                    switch selectedTab {
                    case 0:
                        HomeScreen()
                        
                    case 1:
                        NotificationsScreen()
                        
                    case 2:
                        Orders()
                        
                    case 3:
                        Profile()
                        
                    default:
                        HomeScreen()
                    }
                }
                
                // Custom Tab Bar
                HStack(alignment: .bottom) {
                    tabButton( icon: selectedTab == 0 ? "home2" : "home2", index: 0)
                    
                    tabButton( icon: selectedTab == 1 ? "notificationbing" : "notificationbing", index: 1)
                    
                    tabButton( icon:selectedTab == 2 ? "receipt1" : "receipt1", index: 2)
                    
                    tabButton( icon: selectedTab == 3 ? "profile" : "profile", index: 3)
                    
                }
                .padding(.top, 8)
                .padding(.bottom, 8)
                .padding(.horizontal, 20)
            }
        }
    }
    
    @ViewBuilder
    private func tabButton(
        icon: String,
        index: Int
    ) -> some View {
        
        Button {
            selectedTab = index
        } label: {
            
            VStack(spacing: 4) {
                
                Image(icon)
                    .renderingMode(.template)
                    .font(.system(size: 24))
                    .foregroundStyle(
                        selectedTab == index ? Color.mediumSlateBlue300: Color.shadowGrey900
                    )
            }
            
            .frame(maxWidth: .infinity)
        }
        
        
    }
}

#Preview {
    NavigationBar()
}
