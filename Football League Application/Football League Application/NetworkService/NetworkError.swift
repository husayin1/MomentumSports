//
//  NetworkError.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation


enum NetworkError: Error {
    case networkUnreachable
    case invalidResponse
    case decodingError
    case serverError(String)
    case other(String)
    case networkError(message: String)

    
    var message: String {
        switch self {
        case .networkUnreachable:
            return "Oops! Something went wrong with the network. Please check your internet connection and try again."
        case .invalidResponse:
            return "Received invalid response from server."
        case .decodingError:
            return "Failed to decode server response."
        case .networkError(let networkMessage):
            return networkMessage
        case .serverError(let message):
            return message
        case .other(let message):
            return message
        }
    }
}
