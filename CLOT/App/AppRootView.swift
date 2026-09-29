//
//  AppRootView.swift
//  CLOT
//
//  Created by Toluwalase on 23/09/2026.
//

import SwiftUI

struct AppRootView: View {
    @State private var isSplash = true
    var body: some View {
        Group{
            if isSplash {
                SplashScreen()
            }else{
                SignIn()
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 5){
                withAnimation(.easeInOut){
                    isSplash = false
                }
            }
        }
    }
}

#Preview {
    AppRootView()
}
