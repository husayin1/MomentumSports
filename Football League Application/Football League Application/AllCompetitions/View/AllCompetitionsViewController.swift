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
    @IBOutlet weak var competitionsTableView: UITableView!
    
    
    private let viewModel = AllCompetitionsViewModel()
    private let disposeBag = DisposeBag()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerTableViewCell()
        // Bind the competitions data to the table view
        bindCompetitions()
        
        // Fetch competitions data
        viewModel.getCompetitions()
        
        handleCellTap() // Handle cell selection
        
    }
    
    private func bindCompetitions() {
        viewModel.competitions
            .bind(to: competitionsTableView.rx.items(cellIdentifier: AllCompetitionsTableViewCell.identifier, cellType: AllCompetitionsTableViewCell.self)) { index, competition, cell in
                // Bind competition data to the table view cell
                cell.setupCell(with: competition)
            }
            .disposed(by: disposeBag)
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: AllCompetitionsTableViewCell.identifier, bundle: nil)
        competitionsTableView.register(nib, forCellReuseIdentifier: AllCompetitionsTableViewCell.identifier)
    }
    
    private func handleCellTap() {
        competitionsTableView.rx.modelSelected(Competition.self)
            .subscribe(onNext: { [weak self] competition in
                guard let self = self else { return }
                print("Cell Tapped: \(competition.id)")
                self.navigateToCompetitionDetails(with: competition)
            })
            .disposed(by: disposeBag)
    }
    
    private func navigateToCompetitionDetails(with competition: Competition) {
        let controller = CompetitionsDetailsViewController.instantiate()
        controller.competitionId = competition.id ?? 2000
        controller.title = competition.type
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

