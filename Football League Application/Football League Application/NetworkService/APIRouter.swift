//
//  APIRouter.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case competitions
    
    
    var method: HTTPMethod {
        switch self {
        case .competitions:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .competitions:
            return URLEncoding(destination: .queryString)
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .competitions:
            return nil
        }
    }
    
    
    
    var path: String {
        switch self {
        case .competitions:
            return APIResources.competitions.endpoint
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.rawValue.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
}
