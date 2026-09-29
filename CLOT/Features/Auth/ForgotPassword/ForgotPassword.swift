//
//  ForgotPassword.swift
//  CLOT
//
//  Created by Toluwalase on 24/09/2026.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var enterEmailAddress = ""
    var body: some View {
        VStack(alignment: .leading){
            AppText(title: "Forgot Password", fontSize: 32, textColor: .shadowGrey900, fontWeight: .bold)
            
            VStack(alignment: .leading){
                InputTextField(placeholder: "Enter Email address", text: $enterEmailAddress)
                    .padding(.bottom, 16)
                
                NavigationLink{
                    PasswordResetSuccessView()
                        .navigationBarBackButtonHidden()
                }label: {
                    AppText(title: "Continue", fontSize: 16, textColor: .white, fontWeight: .medium)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .fill(.mediumSlateBlue300)
                )
                .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 20)
        .background(.midnightViolet900)
        .safeAreaInset(edge: .bottom,){}
    }
}



#Preview {
    ForgotPassword()
}
