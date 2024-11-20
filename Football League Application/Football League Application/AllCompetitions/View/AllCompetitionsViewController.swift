//
//  AllCompetitionsViewController.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import UIKit
import RxSwift
import RxCocoa

class AllCompetitionsViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak private var competitionsTableView: UITableView!
    
    // MARK: - Dependencies
    private let viewModel = AllCompetitionsViewModel(competitionsService: RemoteDataSoure())
    private let disposeBag = DisposeBag()
    private let loader = Loader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        fetchCompetitions()
        
    }
    
    
}
// MARK: - Setup & Binding

extension AllCompetitionsViewController {
    // MARK: - Private Methods
    private func setupUI() {
        registerTableViewCell()
        loader.attach(to: view)
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: AllCompetitionsTableViewCell.identifier, bundle: nil)
        competitionsTableView.register(nib, forCellReuseIdentifier: AllCompetitionsTableViewCell.identifier)
    }
    
    
    private func bindCompetitions() {
        viewModel.competitions
            .bind(to: competitionsTableView.rx.items(
                cellIdentifier: AllCompetitionsTableViewCell.identifier,
                cellType: AllCompetitionsTableViewCell.self
            )) { _ , competition, cell in
                cell.configure(with: competition)
            }
            .disposed(by: disposeBag)
        
    }
    
    
    // MARK: - Binding
    private func bindViewModel() {
        bindCompetitions()
        observeLoadingState()
        handleCellSelection()
        bindErrorState()
    }
    private func bindErrorState() {
        viewModel.error
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] errorMessage in
                ErrorHandler.showErrorAlert(on: self!, message: errorMessage)
            })
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
    
    private func handleCellSelection() {
        competitionsTableView.rx.modelSelected(Competition.self)
            .subscribe(onNext: { [weak self] competition in
                self?.navigateToCompetitionDetails(with: competition)
            })
            .disposed(by: disposeBag)
    }
    
    private func fetchCompetitions() {
        viewModel.loadCompetitions()
    }
    
    
    
    
}
//MARK: - Navigation Handling
extension AllCompetitionsViewController {
    private func navigateToCompetitionDetails(with competition: Competition) {
        let controller = CompetitionsDetailsViewController.instantiate()
        controller.competitionId = competition.id ?? 2000
        controller.title = competition.type
        navigationController?.pushViewController(controller, animated: true)
    }
}
