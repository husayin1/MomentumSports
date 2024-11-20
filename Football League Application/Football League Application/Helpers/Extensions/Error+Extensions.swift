//
//  Error+Extensions.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
extension Error {
    var asReadableMessage: String {
        if let networkError = self as? NetworkError {
            return networkError.message
        }
        return "An unexpected error occurred."
    }
}
