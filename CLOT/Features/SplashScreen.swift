//
//  SplashScreen.swift
//  CLOT
//
//  Created by Toluwalase on 23/09/2026.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack{
            Image("clot_logo")
                .resizable()
                .frame(width: 100,height: 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.mediumSlateBlue300)
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    SplashScreen()
}
