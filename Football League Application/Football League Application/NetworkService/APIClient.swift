//
//  APIClient.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import Alamofire
import RxSwift

class APIClient: APIClientProtocol {
    
    static let shared = APIClient()
    
    private init() {}
    
    func performRequest<T: Decodable>(
        route: APIRouter,
        decoder: JSONDecoder = JSONDecoder()
    ) -> Observable<T> {
        return Observable.create { observer in
            print(route.urlRequest!.url!)
            
            AF.request(route).validate().responseDecodable { (response: AFDataResponse<T>) in
                print("Result: ", response.result)
                switch response.result {
                case .success(let model):
                    observer.onNext(model)
                    observer.onCompleted()
                
                case .failure(let error):
                    print("Error: ", error.localizedDescription)
                    
                    if let data = response.data {
                        // Log the raw response for debugging purposes
                        if let rawResponse = String(data: data, encoding: .utf8) {
                            print("Raw Response: ", rawResponse)
                        }
                        
                        do {
                            let json = try JSONSerialization.jsonObject(with: data, options: [])
                            if let message = (json as? [String: Any])?["Message"] as? String {
                                observer.onError(NetworkError.networkError(message: message))
                            } else {
                                observer.onError(NetworkError.decodingError)
                            }
                        } catch {
                            print("JSON Serialization Error: ", error.localizedDescription)
                            observer.onError(NetworkError.decodingError)
                        }
                    } else {
                        observer.onError(NetworkError.other(error.localizedDescription))
                    }
                }
            }
            
            return Disposables.create()
        }
    }
}
