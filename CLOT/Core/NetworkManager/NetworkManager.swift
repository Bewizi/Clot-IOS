//
//  NetworkManager.swift
//  CLOT
//
//  Created by Toluwalase on 25/09/2026.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "http://localhost:8000/api"
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    private init() {}
    
    func login(email: String, password: String) async throws -> LoginResponse {
        try await request(
            path: "/login",
            method: "POST",
            body: LoginRequest(email: email, password: password)
        )
    }
    
    func register(user: UserModel) async throws -> LoginResponse {
        try await request(
            path: "/register",
            method: "POST",
            body: user
        )
    }

    func savePreferences(
        shoppingFor: String,
        ageRange: String,
        token: String
    ) async throws -> UserPreferencesResponse {
        try await request(
            path: "/preferences",
            method: "POST",
            body: UserPreferencesRequest(
                shoppingFor: shoppingFor,
                ageRange: ageRange
            ),
            token: token
        )
    }
    
    private func request<Body: Encodable, Response: Decodable>(
        path: String,
        method: String,
        body: Body? = nil,
        token: String? = nil
    ) async throws -> Response {
        guard let url = URL(string: baseURL + path) else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let body {
            request.httpBody = try encoder.encode(body)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APError.invalidResponse
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                let serverError = try? decoder.decode(ServerErrorResponse.self, from: data)
                throw APError.server(message: serverError?.message ?? "The request failed.")
            }
            
            do {
                return try decoder.decode(Response.self, from: data)
            } catch {
                throw APError.invalidData
            }
        } catch let error as APError {
            throw error
        } catch {
            throw APError.unableToComplete
        }
    }
}

private struct LoginRequest: Encodable {
    let email: String
    let password: String
}

private struct UserPreferencesRequest: Encodable {
    let shoppingFor: String
    let ageRange: String

    enum CodingKeys: String, CodingKey {
        case shoppingFor = "shopping_for"
        case ageRange = "age_range"
    }
}

struct UserPreferencesResponse: Decodable {
    let id: String
    let userId: String
    let shoppingFor: String
    let ageRange: String

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case shoppingFor = "shopping_for"
        case ageRange = "age_range"
    }
}

struct LoginResponse: Decodable {
    let token: String
    let user: UserResponse
}

struct UserResponse: Decodable {
    let id: String
    let firstname: String
    let lastname: String
    let email: String
}

private struct ServerErrorResponse: Decodable {
    let message: String
}
