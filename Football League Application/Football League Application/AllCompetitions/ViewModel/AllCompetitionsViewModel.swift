//
//  AllCompetitionsViewModel.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import Foundation
import RxSwift

class AllCompetitionsViewModel {
    
    let remoteService = RemoteDataSoure(networkService: APIClient.shared)
    let competitions: PublishSubject<[Competition]> = PublishSubject()
    let error: PublishSubject<String> = PublishSubject()

    private let disposeBag = DisposeBag()

    func getCompetitions() {
            print("Requesting competitions...")
            
        remoteService.getCompetitions()
                .subscribe(
                    onNext: { [weak self] competitionResponse in
                        // Handle success
                        print("Competitions received: \(competitionResponse)")
                        self?.competitions.onNext(competitionResponse.competitions)
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
