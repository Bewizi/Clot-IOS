//
//  SignIn.swift
//  CLOT
//
//  Created by Toluwalase on 24/09/2026.
//

import SwiftUI

struct SignIn: View {
    @StateObject private var viewModel = SignInViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading){
                AppText(title: "Sign in", fontSize: 32, textColor: .shadowGrey900, fontWeight: .bold)
                
                VStack(alignment: .leading){
                    InputTextField(placeholder: "Email Address", text: $viewModel.email)
                        .padding(.bottom, 16)
                    
                    NavigationLink{
                        PasswordScreen(viewModel: viewModel)
                            
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
                
                HStack{
                    Text("Dont have an Account ?")
                    NavigationLink{
                        SignUp()
                            .navigationBarBackButtonHidden()
                    }label:{Text("Create One").font(.system(.headline)).foregroundStyle(.shadowGrey900)}
                }
                VStack(alignment: .leading, spacing: 12){
                    SignInOptions(socialIcon: "Apple", title: "Continue With Apple")
                    SignInOptions(socialIcon: "Google", title: "Continue With Google")
                    SignInOptions(socialIcon: "Facebook", title: "Continue With Facebook")
                }
                .padding(.top, 71)

            }
            .padding(.horizontal, 24)
            .padding(.top, 20)
            .background(.midnightViolet900)
            .safeAreaInset(edge: .bottom,){}
        }
        
       
    }
}

struct PasswordScreen:View {
    @ObservedObject  var viewModel: SignInViewModel
    
    @State private var isPasswordVisible = false
    var body: some View {
        VStack(alignment: .leading){
            AppText(title: "Sign in", fontSize: 32, textColor: .shadowGrey900, fontWeight: .bold)
            
            VStack(alignment: .leading){
                HStack{
                    if isPasswordVisible {
                        TextField("Password", text: $viewModel.password)
                    } else {
                        SecureField("Password", text: $viewModel.password)
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
                    .padding(.bottom, 16)
                
                
                HStack{
                    Text("Forgot Password ? ")
                    NavigationLink{
                        ForgotPassword()
                    }label:{Text("Reset").font(.system(.headline)).foregroundStyle(.shadowGrey900)}
                }
                .padding(.bottom, 16)
                
                Button{
                    Task {
                        await viewModel.login()
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
                .padding(.bottom, 16)
            }
        }
        .padding(.horizontal, 24)
        .navigationDestination(isPresented: $viewModel.loginSucceeded ){
            NavigationBar()
                .navigationBarBackButtonHidden()
        }
        .alert(
            "SingIn Error",
            isPresented: Binding(
                get:{viewModel.errorMessage != nil},
                set:{if !$0 {viewModel.errorMessage = nil} }
            )
        ){
            Button("OK"){
                viewModel.errorMessage = nil
            }
        }message: {
            Text(viewModel.errorMessage ?? "")
        }
        
        .padding(.top, 20)
        .background(.midnightViolet900)
        .safeAreaInset(edge: .bottom,){}
    }
}

struct SignInOptions: View {
    let socialIcon: String
    let title: String
    
    var body: some View {
        ZStack{
            AppText(title: title, fontSize: 16, textColor: .shadowGrey900, fontWeight: .medium)
            
            
            HStack{
                Image(socialIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                
                Spacer()
            }
            
            
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 12)
        .padding(.horizontal, 20)
        
        .background(
            RoundedRectangle(cornerRadius: 100)
                .fill(.whiteSmoke50)
        )
    }
}

#Preview {
    SignIn()
}
