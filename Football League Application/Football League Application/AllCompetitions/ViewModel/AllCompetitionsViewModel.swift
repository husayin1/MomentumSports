//
//  AllCompetitionsViewModel.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import Foundation
import RxSwift
import RxRelay

final class AllCompetitionsViewModel {
    
    // MARK: - Dependencies
    private let competitionsService: CompetitionsService
    private let disposeBag = DisposeBag()
    
    // MARK: - Subjects
    let competitions = PublishSubject<[Competition]>()
    let error = PublishSubject<String>()
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Initialization
    init(competitionsService: CompetitionsService) {
        self.competitionsService = competitionsService
    }
    
    // MARK: - Public Methods
    func loadCompetitions() {
        isLoading.accept(true)
        
        competitionsService.getCompetitions()
            .subscribe(
                onNext: { [weak self] competitionResponse in
                    self?.handleSuccess(response: competitionResponse)
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
    
    // MARK: - Private Methods
     private func handleSuccess(response: CompetitionResponse) {
         isLoading.accept(false)
         competitions.onNext(response.competitions)
     }
     
     private func handleError(error: Error) {
         isLoading.accept(false)
         self.error.onNext(error.asReadableMessage)
     }
}
