//
//  CompetitionsDetailsViewModel.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import RxSwift
import RxCocoa

final class CompetitionsDetailsViewModel {
    
    // MARK: - Dependencies
    private let competitionsDetailsService: CompetitionsDetailsService
    private let disposeBag = DisposeBag()
    
    //MARK: - Subjects for Observables
    let competitionsDetails = PublishSubject<[Match]>()
    let error = PublishSubject<String>()
    let headerDetails = PublishSubject<CompetitionsDetailsResponse>()
    let isLoading = BehaviorRelay<Bool>(value: false)

    //MARK: - Initializer
    init(competitionsDetailsService: CompetitionsDetailsService){
        self.competitionsDetailsService = competitionsDetailsService
    }

    //MARK: - fetchCompetitionsDetails
    func getCompetitionsDetailsBy(id: Int) {
        isLoading.accept(true)

        competitionsDetailsService.getCompetitionsDetails(by: id)
            .subscribe(
            onNext: { [weak self] competitionDetailsResponse in
                self?.handleSuccess(response: competitionDetailsResponse)
            },
            onError: { [weak self] error in
                self?.handleError(error: error)
            },
            onCompleted: { [weak self] in
                self?.isLoading.accept(false)
            }
        )
        .disposed(by: disposeBag)
    }
    
    // MARK: - Private Methods To Handle Observables
    private func handleSuccess(response: CompetitionsDetailsResponse) {
        isLoading.accept(false)
        headerDetails.onNext(response)
        competitionsDetails.onNext(response.matches ?? [])
    }
    
    private func handleError(error: Error) {
        isLoading.accept(false)
        self.error.onNext(error.asReadableMessage)
    }
}
