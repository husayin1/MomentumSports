//
//  APIResources.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation

enum APIResources {
    case competitions
    case competitionDetails(id: Int)
    case matches(id: Int)
    var endpoint: String {
        switch self {
        case .competitions:
            return "competitions"
        case .competitionDetails(let id):
            return "competitions/\(id)/matches"
        case .matches(let id):
            return "matches/\(id)"
        }
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case authorization = "X-Auth-Token"
}

extension HTTPHeaderField {
    var token: String {
        switch self {
        case .authorization:
            return "\(Constants.apiToken.rawValue)"
        default:
            return self.rawValue
        }
    }
}

enum ContentType: String {
    case json = "application/json"
    case any = "*/*"
}
