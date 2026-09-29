//
//  AppError.swift
//  CLOT
//
//  Created by Toluwalase on 25/09/2026.
//

import Foundation

enum APError: LocalizedError {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case server(message: String)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The server URL is invalid."
        case .invalidResponse:
            return "The server returned an invalid response."
        case .invalidData:
            return "The server returned invalid data."
        case .unableToComplete:
            return "The request could not be completed. Check your connection."
        case let .server(message):
            return message
        }
    }
}
