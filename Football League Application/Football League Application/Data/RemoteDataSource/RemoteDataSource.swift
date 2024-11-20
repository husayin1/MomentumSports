//
//  RemoteDataSource.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift

class RemoteDataSoure: APIClient, CompetitionsService, CompetitionsDetailsService, MatchInfoService {
    
    func getCompetitions() -> Observable<CompetitionResponse> {
        print("Performing get competitions")
        return performRequest(route: .competitions)
    }
    
    func getCompetitionsDetails(by id: Int) -> Observable<CompetitionsDetailsResponse> {
        print("Performing get Competitiong Details ...")
        return performRequest(route: .competitionDetails(competitionId: id))
    }
    
    func getMatchInfo(by id: Int) -> Observable<Match> {
        print("Performing get Match Info ...")
        return performRequest(route: .matches(matchId: id))
    }
}
