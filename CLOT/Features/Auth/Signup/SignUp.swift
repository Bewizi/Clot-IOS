//
//  SignUp.swift
//  CLOT
//
//  Created by Toluwalase on 23/09/2026.
//

import SwiftUI

struct SignUp: View {
    @StateObject var viewModel = SignUpViewModel()
    @State private var isPasswordVisible = false
    
    var body: some View {
        VStack(alignment: .leading){
            AppText(title: "Create Account", fontSize: 32, textColor: .shadowGrey900, fontWeight: .bold)
                .padding(.bottom, 32)
            
            VStack(alignment: .leading, spacing: 16){
                InputTextField(placeholder: "Firstname", text: $viewModel.user.firstName)
                InputTextField(placeholder: "Lastname", text: $viewModel.user.lastName)
                InputTextField(placeholder: "Email Address", text: $viewModel.user.email)
                HStack{
                    if isPasswordVisible {
                        TextField("Password", text: $viewModel.user.password)
                    } else {
                        SecureField("Password", text: $viewModel.user.password)
                    }
                    
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundStyle(.gray)
                    }
                    .accessibilityLabel(
                        isPasswordVisible ? "Hide password" : "Show password"
                    )
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 19)
                .background(.whiteSmoke50)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            }
            .padding(.bottom, 40)
            
            Button {
                Task {
                    await viewModel.register()
                }
            }label: {
                Group{
                    if viewModel.isLoading{
                        ProgressView()
                    }else{
                        AppText(title: "Continue", fontSize: 16, textColor: .white, fontWeight: .medium)
                    }
                }
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding()
                
            }
            .background(.mediumSlateBlue300)
            .clipShape(RoundedRectangle(cornerRadius: 100))
            .disabled(viewModel.isLoading)
            .padding(.bottom, 40)
        }
        .padding(.horizontal, 24)
        .navigationDestination(
            isPresented: $viewModel.registrationSucceeded
        ) {
            UserPreferencesView(token: viewModel.authToken ?? "")
                .navigationBarBackButtonHidden()
        }
        .alert(
            "Signup Error",
            isPresented: Binding(
                get: { viewModel.errorMessage != nil },
                set: { if !$0 { viewModel.errorMessage = nil } }
            )
        ) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
        .padding(.top, 20)
        .background(.midnightViolet900)
        .safeAreaInset(edge: .bottom,){}
    }
}

#Preview {
    SignUp()
}
