//
//  SignInViewModel.swift
//  CLOT
//
//  Created by Toluwalase on 29/09/2026.
//

import Foundation
import Combine

final class SignInViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var loginSucceeded = false
    @Published var errorMessage: String?
    @Published var authToken: String?
    @Published var authenticatedUser: UserResponse?
    
    var isSignInFormValid:Bool{
        email.contains("@") &&
        email.contains(".") &&
        !password.isEmpty
    }
    
    func login() async{
        guard isSignInFormValid else{
            errorMessage = "Please enter a valid email and password."
                        return
        }
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await NetworkManager.shared.login(email: email, password: password)
            
            authToken = response.token
            authenticatedUser = response.user
            UserDefaults.standard.set(response.token, forKey: "authToken")
            loginSucceeded = true
        }catch let error as APError {
            errorMessage = error.localizedDescription
        }catch {
            errorMessage = "Something went worng"
        }
        isLoading = false
    }
}
