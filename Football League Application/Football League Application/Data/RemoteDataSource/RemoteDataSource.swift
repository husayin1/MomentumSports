//
//  RemoteDataSource.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift

class RemoteDataSoure: RemoteDataSourceProtocol {
    let apiClient: APIClient
    
    init(networkService: APIClient){
        self.apiClient = networkService
    }
    
    func getCompetitions() -> Observable<CompetitionResponse> {
        print("Performing get competitions")
        return apiClient.performRequest(route: .competitions)
    }
}
