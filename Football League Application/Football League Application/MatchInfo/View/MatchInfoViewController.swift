//
//  MatchInfoViewController.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit
import RxSwift
import RxCocoa

final class MatchInfoViewController: UIViewController {
    //MARK: - Outlets
    
    @IBOutlet weak var headerSubView: MatchHeaderView!
    @IBOutlet weak var matchDetailsView: WinnerView!
    @IBOutlet weak var leagueDetailsView: LeagueDetails!
    
    //MARK: - Dependencies
    private let viewModel = MatchInfoViewModel(matchService: RemoteDataSoure())
    private let disposeBag = DisposeBag()
    var matchId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMatchInfo()
        bindViewModel()
    }
    

}

//MARK: - Setup
extension MatchInfoViewController {
    
    private func setupHeaderView(with match: Match){
        headerSubView.configureView(with: match)
        matchDetailsView.configureView(with: match)
        leagueDetailsView.configureView(with: match)
    }
    private func bindViewModel(){
        bindMatchInfo()
        observeLoadingState()
        bindErrorState()
        
    }
    private func bindMatchInfo(){
        viewModel.match
            .subscribe(onNext: {[weak self] match in
                self?.setupHeaderView(with: match)
            })
            .disposed(by: disposeBag)
    }
    private func getMatchInfo(){
        guard let matchId = matchId else { return }
        print("match id is \(matchId)")
        viewModel.getMatchInfo(for: matchId)
    }
    private func observeLoadingState() {
        viewModel.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                isLoading ?
                self?.showLoader() :
                self?.hideLoader()
            })
            .disposed(by: disposeBag)
        
    }
    
    private func bindErrorState() {
        viewModel.error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] errorMessage in
                ErrorHandler.showErrorAlert(on: self!, message: errorMessage)
            })
            .disposed(by: disposeBag)
        
    }
}

