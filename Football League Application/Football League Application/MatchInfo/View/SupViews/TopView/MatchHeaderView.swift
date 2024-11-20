//
//  MatchHeaderView.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import UIKit

final class MatchHeaderView: UIView {
    
    //MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak private var homeTeamImageView: UIImageView!
    @IBOutlet weak private var homeTeamLabel: UILabel!
    @IBOutlet weak private var matchDateLabel: UILabel!
    @IBOutlet weak private var matchStatusLabel: UILabel!
    @IBOutlet weak private var matchDayLabel: UILabel!
    
    @IBOutlet weak private var awayTeamImageView: UIImageView!
    
    @IBOutlet weak var awayTeamLabel: UILabel!
    //MARK: - Initializers
    required init?(coder: NSCoder) {
        print("Init of the nib: ---")
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
        loadImages(for: match)
    }
    
    //MARK: - Private Methods
    private func setup(){
        print("test")
        Bundle.main.loadNibNamed("MatchHeaderView", owner: self)
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.frame = self.bounds
        addSubview(containerView)
        print("Finish here")
    }
    private func setupTeams(with match: Match){
        homeTeamLabel.text = match.homeTeam?.shortName ?? "N/A"
        awayTeamLabel.text = match.awayTeam?.shortName ?? "N/A"
        matchDateLabel.text = match.utcDate?.formattedDate() ?? "N/A"
        matchStatusLabel.text = match.status ?? "N/A"
        matchDayLabel.text = String(describing: match.matchday ?? 1).asMatchday()
    }
    
    
    private func loadImages(for match: Match){
        let placeholder = UIImage(named: "cup")
        DefaultImageLoader.loadImage(from: match.homeTeam?.crest?.asUrl, into: homeTeamImageView, placeholder: placeholder)
        DefaultImageLoader.loadImage(from: match.awayTeam?.crest?.asUrl, into: awayTeamImageView, placeholder: placeholder)
    }
    
    
}
