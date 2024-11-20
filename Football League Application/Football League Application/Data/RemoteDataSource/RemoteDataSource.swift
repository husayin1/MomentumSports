//
//  RemoteDataSource.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift

class RemoteDataSoure: CompetitionsService, CompetitionsDetailsService, MatchInfoService {
    let apiClient: APIClient
    
    init(networkService: APIClient){
        self.apiClient = networkService
    }
    
    func getCompetitions() -> Observable<CompetitionResponse> {
        print("Performing get competitions")
        return apiClient.performRequest(route: .competitions)
    }
    
    func getCompetitionsDetails(by id: Int) -> RxSwift.Observable<CompetitionsDetailsResponse> {
        print("Performing get Competitiong Details ...")
        return apiClient.performRequest(route: .competitionDetails(competitionId: id))
    }
    
    func getMatchInfo(by id: Int) -> Observable<MatchInfoResponse> {
        print("Performing get Match Info ...")
        return apiClient.performRequest(route: .matches(matchId: id))
    }
}
