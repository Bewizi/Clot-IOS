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
            loginSucceeded = true
        }catch let error as APError {
            errorMessage = error.localizedDescription
        }catch {
            errorMessage = "Something went worng"
        }
        isLoading = false
    }
}
