//
//  APIClientProtocol.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift

protocol APIClientProtocol {
    func performRequest<T: Decodable>(
        route: APIRouter,
        decoder: JSONDecoder
    ) -> Observable<T>
}
