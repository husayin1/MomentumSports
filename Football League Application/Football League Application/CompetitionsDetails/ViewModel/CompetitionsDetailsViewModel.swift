//
//  CompetitionsDetailsViewModel.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift

class CompetitionsDetailsViewModel {
    
    let remoteService = RemoteDataSoure(networkService: APIClient.shared)
    let competitions: PublishSubject<CompetitionsDetailsResponse> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    
    private let disposeBag = DisposeBag()
    
    func getCompetitionsDetailsBy(id: Int) {
        print("Requesting competitions...")
        
        remoteService.getCompetitionsDetails(by: id)
            .subscribe(
            onNext: { [weak self] competitionDetailsResponse in
                // Handle success
                print("Competitions received: \(competitionDetailsResponse)")
                self?.competitions.onNext(competitionDetailsResponse)
            },
            onError: { [weak self] error in
                // Handle error
                if let networkError = error as? NetworkError {
                    print("Error: \(networkError.message)")
                    self?.error.onNext(networkError.message)
                } else {
                    print("Unexpected error: \(error)")
                    self?.error.onNext("An unexpected error occurred.")

                }
            },
            onCompleted: {
                print("Request completed.")
            }
        )
        .disposed(by: disposeBag)
        
    }
}
