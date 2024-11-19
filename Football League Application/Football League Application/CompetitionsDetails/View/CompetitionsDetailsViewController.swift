//
//  CompetitionsDetailsViewController.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit
import RxSwift

class CompetitionsDetailsViewController: UIViewController {

    
    @IBOutlet weak var competitionsDetailsTableView: UITableView!
    
    @IBOutlet weak var comptetionsImageView: UIImageView!
    
    @IBOutlet weak var competitionNameLabel: UILabel!
    
    @IBOutlet weak var competitionSeasonLabel: UILabel!
    
    private let viewModel = CompetitionsDetailsViewModel()
    private let disposeBag = DisposeBag()
    
    var competitionId: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableViewCell()
        viewModel.getCompetitionsDetailsBy(id: competitionId)
        
        bindCompetitionsDetails()
        setuiHeader()
    }

    private func bindCompetitionsDetails() {
        viewModel.competitionsDetails
            .bind(to: competitionsDetailsTableView.rx.items(cellIdentifier: CompetitionsDetailsTableViewCell.identifier, cellType: CompetitionsDetailsTableViewCell.self)) { index, match, cell in
                // Bind competition data to the table view cell
                cell.setupCell(with: match)
            }
            .disposed(by: disposeBag)
    }
    
    private func setuiHeader(){
        viewModel.headerDetails
            .subscribe(onNext: { [weak self] details in
                // Update labels with data.
                self?.competitionNameLabel.text = details.competition?.name
                self?.competitionSeasonLabel.text = details.filters?.season
                self?.comptetionsImageView.kf.setImage(with: details.competition?.emblem?.asUrl, placeholder: UIImage(named: "cup"))
            })
            .disposed(by: disposeBag)
    }
    
    private func registerTableViewCell() {
        let nib = UINib(nibName: CompetitionsDetailsTableViewCell.identifier, bundle: nil)
        competitionsDetailsTableView.register(nib, forCellReuseIdentifier: CompetitionsDetailsTableViewCell.identifier)
    }
}
