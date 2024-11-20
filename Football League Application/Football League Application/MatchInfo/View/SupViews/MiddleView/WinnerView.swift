//
//  MatchDetailsView.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import UIKit

class WinnerView: UIView {

    @IBOutlet weak private var containerView: UIView!
    @IBOutlet weak private var winnerName: UILabel!
    @IBOutlet weak private var homeScoreFirstHalfLabel: UILabel!
    @IBOutlet weak private var awayScoreFirstHalfLabel: UILabel!
    @IBOutlet weak private var homeScoreSecondHalfLabel: UILabel!
    @IBOutlet weak private var awayScoreSecondHalfLabel: UILabel!
    @IBOutlet weak private var refereeName: UILabel!
    //MARK: - Initializers
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //MARK: - configure Method
    func configureView(with match:Match){
        print("Start configureing this view ....")
        setupTeams(with: match)
    }
    
    //MARK: - Private Methods
    private func setup(){
        print("test")
        Bundle.main.loadNibNamed("WinnerView", owner: self)
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.frame = self.bounds
        addSubview(containerView)
        print("Finish here")
    }
    
    private func setupTeams(with match: Match){
        winnerName.text = match.score?.winner ==  "HOME_TEAM" ? match.homeTeam?.name ?? "N/A" : match.awayTeam?.name ?? "N/A"
        homeScoreFirstHalfLabel.text = String(describing: match.score?.halfTime?.home ?? 0)
        awayScoreFirstHalfLabel.text = String(describing: match.score?.halfTime?.away ?? 0)
        homeScoreSecondHalfLabel.text = String(describing: match.score?.fullTime?.home ?? 0)
        awayScoreSecondHalfLabel.text = String(describing: match.score?.fullTime?.away ?? 0)
        refereeName.text = match.referees?.first?.name ?? "Gehad Gresha"
    }
    
    
    
}
