//
//  CompetitionsDetailsViewController.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit
import RxSwift

class CompetitionsDetailsViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    
    private let viewModel = CompetitionsDetailsViewModel()
    private let disposeBag = DisposeBag()
    
    var competitionId: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.getCompetitionsDetailsBy(id: 2000)
        self.myLabel.text = "ComptetionId is: \(competitionId)"
    }
    
    


}
