//
//  MatchInfoViewModel.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation
import RxSwift
import RxCocoa

final class MatchInfoViewModel {
    
    //MARK: - Dependencies
    private let matchService: MatchInfoService
    private let disposeBag = DisposeBag()
    
    //MARK: - Subjects
    let match = PublishSubject<Match>()
    let error = PublishSubject<String>()
    let isLoading = BehaviorRelay(value: false)
    
    //MARK: - Initializer
    init(matchService: MatchInfoService) {
        self.matchService = matchService
    }
    
    //MARK: - get Match Info
    func getMatchInfo(for id: Int){
        isLoading.accept(true)
        
        matchService.getMatchInfo(by: id)
            .subscribe(onNext: { [weak self] matchInfo in
                self?.handleSuccess(response: matchInfo)
            }, onError: { [weak self] error in
                self?.handleError(error: error)
                
            },onCompleted: {[weak self] in
                self?.isLoading.accept(false)
                
            }).disposed(by: disposeBag)
    }
    
    //MARK: - Private Methods
    private func handleSuccess(response: Match){
        isLoading.accept(false)
        match.onNext(response)
    }
    
    private func handleError(error: Error){
        isLoading.accept(false)
        self.error.onNext(error.asReadableMessage)
    }
    
}
