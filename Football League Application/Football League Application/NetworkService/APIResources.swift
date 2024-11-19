//
//  APIResources.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation

enum APIResources {
    case competitions
    
    var endpoint: String {
        switch self {
        case .competitions:
            return "competitions"
        }
    }
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}


enum ContentType: String {
    case json = "application/json"
    case any = "*/*"
}
