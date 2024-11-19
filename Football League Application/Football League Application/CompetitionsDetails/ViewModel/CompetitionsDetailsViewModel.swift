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
    let competitionsDetails: PublishSubject<[Match]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()
    let headerDetails: PublishSubject<CompetitionsDetailsResponse> = PublishSubject()

    private let disposeBag = DisposeBag()
    
    func getCompetitionsDetailsBy(id: Int) {
        print("Requesting competitions...")
        
        remoteService.getCompetitionsDetails(by: id)
            .subscribe(
            onNext: { [weak self] competitionDetailsResponse in
                // Handle success
                print("Competitions received: \(competitionDetailsResponse)")
                self?.headerDetails.onNext(competitionDetailsResponse)
                self?.competitionsDetails.onNext(competitionDetailsResponse.matches!)
            },
            onError: { [weak self] error in
                // Handle error
                if let networkError = error as? NetworkError {
                    print("Error in here: \(networkError.message)")
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
