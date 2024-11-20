//
//  CompetitionsDetailsViewController.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit
import RxSwift
import RxCocoa

final class CompetitionsDetailsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var competitionsDetailsTableView: UITableView!
    @IBOutlet weak var comptetionsImageView: UIImageView!
    @IBOutlet weak var competitionNameLabel: UILabel!
    @IBOutlet weak var competitionSeasonLabel: UILabel!
    
    // MARK: - Properties
    private let viewModel = CompetitionsDetailsViewModel(competitionsDetailsService: RemoteDataSoure(networkService: APIClient.shared))
    private let disposeBag = DisposeBag()
    private let loader = Loader()
    var competitionId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        fetchCompetitionDetails()
    }
    
    
    
}

extension CompetitionsDetailsViewController {
    // MARK: - Private Methods
    private func setupUI() {
        registerTableViewCell()
        competitionsDetailsTableView.tableFooterView = UIView()
        loader.attach(to: view)
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: CompetitionsDetailsTableViewCell.identifier, bundle: nil)
        competitionsDetailsTableView.register(nib, forCellReuseIdentifier: CompetitionsDetailsTableViewCell.identifier)
    }
    
    private func fetchCompetitionDetails() {
        guard let competitionId = competitionId else { return }
        viewModel.getCompetitionsDetailsBy(id: competitionId)
    }
    
    private func bindViewModel() {
        bindCompetitionsDetails()
        bindHeaderDetails()
        observeLoadingState()
        bindErrorState()
        handleCellSelection()
    }
    private func bindCompetitionsDetails() {
        viewModel.competitionsDetails
            .bind(to: competitionsDetailsTableView.rx.items(cellIdentifier: CompetitionsDetailsTableViewCell.identifier, cellType: CompetitionsDetailsTableViewCell.self)) { _, match, cell in
                cell.configure(with: match)
            }
            .disposed(by: disposeBag)
    }
    
    private func observeLoadingState() {
        viewModel.isLoading
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLoading in
                isLoading ?
                self?.loader.show() :
                self?.loader.hide()
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
    
    
    private func bindHeaderDetails() {
        viewModel.headerDetails
            .subscribe(onNext: { [weak self] details in
                self?.updateHeader(with: details)
            })
            .disposed(by: disposeBag)
    }
    
    private func updateHeader(with details: CompetitionsDetailsResponse) {
        competitionNameLabel.text = details.competition?.name ?? "Unknown"
        competitionSeasonLabel.text = details.filters?.season ?? "Unknown"
        DefaultImageLoader.loadImage(from: details.competition?.emblem?.asUrl, into: comptetionsImageView, placeholder: UIImage(named: "cup"))
    }
    
    private func handleCellSelection() {
        competitionsDetailsTableView.rx.modelSelected(Match.self)
            .subscribe(onNext: { [weak self] match in
                self?.navigateToMatchInfo()
            })
            .disposed(by: disposeBag)
    }
}
//MARK: - Navigation Handling
extension CompetitionsDetailsViewController {
    private func navigateToMatchInfo() {
        let controller = MatchInfoViewController.instantiate()
        navigationController?.pushViewController(controller, animated: true)
    }
}
