//
//  SignUpViewModel.swift
//  CLOT
//
//  Created by Toluwalase on 25/09/2026.
//

import SwiftUI
import Combine

final class SignUpViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var registrationSucceeded = false
    @Published var authToken: String?
    
    
    
    var isFormValid: Bool{
        !user.firstName.trimmingCharacters(in: .whitespaces).isEmpty &&
        !user.lastName.trimmingCharacters(in: .whitespaces).isEmpty &&
        isValidEmail(user.email) &&
        user.password.count >= 8
    }
    
    func register() async{
        guard isFormValid else{
            errorMessage = "Please complete all field correctly."
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await NetworkManager.shared.register(user: user)

                     
            authToken = response.token
            registrationSucceeded = true
        }catch let error as APError {
            errorMessage = error.localizedDescription
        }catch {
            errorMessage = "Something went wrong"
        }
        isLoading = false
    }
    
    private func isValidEmail(_ email: String)->Bool {
        email.contains("@") && email.contains(".")
    }
}
