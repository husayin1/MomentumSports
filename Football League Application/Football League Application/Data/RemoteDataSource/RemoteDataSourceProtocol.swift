//
//  RemoteDataSourceProtocol.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift

protocol RemoteDataSourceProtocol{
    func getCompetitions() -> Observable<CompetitionResponse>
}
