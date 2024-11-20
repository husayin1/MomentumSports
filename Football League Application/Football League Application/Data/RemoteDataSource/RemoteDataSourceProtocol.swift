//
//  RemoteDataSourceProtocol.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift


protocol CompetitionsService{
    func getCompetitions() -> Observable<CompetitionResponse>
}

protocol CompetitionsDetailsService{
    func getCompetitionsDetails(by id: Int) -> Observable<CompetitionsDetailsResponse>
}

protocol MatchInfoService{
    func getMatchInfo(by id: Int) -> Observable<Match>
}

