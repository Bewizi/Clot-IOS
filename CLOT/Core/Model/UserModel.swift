//
//  UserModel.swift
//  CLOT
//
//  Created by Toluwalase on 25/09/2026.
//

import Foundation


struct UserModel: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    
    enum CodingKeys: String, CodingKey {
        case firstName = "firstname"
        case lastName = "lastname"
        case email
        case password
    }
}
