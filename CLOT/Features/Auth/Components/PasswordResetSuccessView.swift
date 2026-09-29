//
//  PasswordResetSuccessView.swift
//  CLOT
//
//  Created by Toluwalase on 24/09/2026.
//

import SwiftUI

struct PasswordResetSuccessView: View {
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            Image("image 4")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 24)
            AppText(title: "We Sent you an Email to reset your password.", fontSize: 24, textColor: .shadowGrey900, fontWeight: .medium)
                .padding(.bottom, 24)
            NavigationLink{
                SignIn()
                    .navigationBarBackButtonHidden()
            }label: {
                AppText(title: "Return to Login", fontSize: 16, textColor: .white, fontWeight: .regular)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 100)
                    .fill(.mediumSlateBlue300)
            )
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 24)
        .background(.midnightViolet900)
    }
}

#Preview {
    PasswordResetSuccessView()
}
