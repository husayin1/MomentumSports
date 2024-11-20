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
    case competitionDetails(competitionId: Int)
    case matches(matchId: Int)
    
    
    var method: HTTPMethod {
        switch self {
        case .competitions, .competitionDetails, .matches:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .competitions, .competitionDetails, .matches:
            return URLEncoding(destination: .queryString)
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .competitions, .competitionDetails, .matches:
            return nil
        }
    }
    
    
    
    var path: String {
        switch self {
        case .competitions:
            return APIResources.competitions.endpoint
        case .competitionDetails(let id):
            return APIResources.competitionDetails(id: id).endpoint
        case .matches(let id):
            return APIResources.matches(id: id).endpoint
        }
    }
    
    var authorizationHeader: HTTPHeaderField? {
        switch self {
        case .competitions, .competitionDetails, .matches:
            return .authorization
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.baseUrl.rawValue.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(ContentType.any.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        if let headerField = authorizationHeader {
            urlRequest.setValue(headerField.token, forHTTPHeaderField: HTTPHeaderField.authorization.rawValue)
        }
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    
}
