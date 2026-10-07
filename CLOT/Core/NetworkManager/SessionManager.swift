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
    
    init() {
        self.isLoggedIn = UserDefaults.standard.string(forKey: "authToken") != nil
    }
    
    func savedToken(_ token:String){
        UserDefaults.standard.set(token, forKey: "authToken")
        isLoggedIn = true
    }
    
    func logOut(){
        UserDefaults.standard.removeObject(forKey: "authToken")
        isLoggedIn = false
    }
}
