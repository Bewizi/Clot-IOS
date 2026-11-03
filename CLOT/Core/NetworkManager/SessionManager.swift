//
//  SessionManager.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import Foundation
import Combine

final class SessionManager: ObservableObject {
    @Published var isLoggedIn : Bool
    @Published var currentUser: UserResponse?
    
    init() {
        self.isLoggedIn = UserDefaults.standard.string(forKey: "authToken") != nil
        if let data = UserDefaults.standard.data(forKey: "currentUser") {
            self.currentUser = try? JSONDecoder().decode(UserResponse.self, from: data)
        } else {
            self.currentUser = nil
        }
    }
    
    func savedToken(_ token:String){
        UserDefaults.standard.set(token, forKey: "authToken")
        isLoggedIn = true
    }

    func saveSession(token: String, user: UserResponse) {
        UserDefaults.standard.set(token, forKey: "authToken")
        if let data = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(data, forKey: "currentUser")
        }
        currentUser = user
        isLoggedIn = true
    }
    
    func logOut(){
        UserDefaults.standard.removeObject(forKey: "authToken")
        UserDefaults.standard.removeObject(forKey: "currentUser")
        currentUser = nil
        isLoggedIn = false
    }
}
