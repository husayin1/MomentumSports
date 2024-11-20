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
    private let offlineService: LocalDataSource
    private let disposeBag = DisposeBag()
    
    // MARK: - Subjects
    let competitions = PublishSubject<[Competition]>()
    let error = PublishSubject<String>()
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    // MARK: - Initialization
    init(competitionsService: CompetitionsService, offlineService: LocalDataSource) {
        self.competitionsService = competitionsService
        self.offlineService = offlineService
    }
    
    // MARK: - Public Methods
    func loadCompetitions() {
        isLoading.accept(true)

        loadCompetitionsFromLocal()

        if NetworkManager.shared.isInternetAvailable() {
            offlineService.deleteCompetitions()
            loadCompetitionsFromRemote()
        } else {
            //show something that indicate no network
            isLoading.accept(false)
        }
    }
    private func loadCompetitionsFromRemote(){
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
        offlineService.saveCompetitions(response.competitions)
        competitions.onNext(response.competitions)
    }
    
    private func handleError(error: Error) {
        isLoading.accept(false)
        self.error.onNext(error.asReadableMessage)
    }
    
    private func loadCompetitionsFromLocal() {
        let savedCompetitions = offlineService.getCompetitions()
        if savedCompetitions.isEmpty {
            error.onNext("No competitions found in local storage.")
        } else {
            competitions.onNext(savedCompetitions)
        }
    }
}
