//
//  CompetitionsDetailsTableViewCell.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit
import Kingfisher

class CompetitionsDetailsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: CompetitionsDetailsTableViewCell.self)

    @IBOutlet weak private var homeTeamImageView: UIImageView!
    
    @IBOutlet weak private var homeTeamNameLabel: UILabel!
    
    @IBOutlet weak private var matchStatusLabel: UILabel!
    
    @IBOutlet weak private var awayTeamImageView: UIImageView!
 
    @IBOutlet weak private var awayTeamNameLabel: UILabel!
    
    func setupCell(with match: Match){
        self.homeTeamNameLabel.text = match.homeTeam?.shortName
        self.matchStatusLabel.text = match.status
        self.awayTeamNameLabel.text = match.awayTeam?.shortName
        self.homeTeamImageView.kf.setImage(with: match.homeTeam?.crest?.asUrl,placeholder: UIImage(named: "cup"))
        self.awayTeamImageView.kf.setImage(with: match.awayTeam?.crest?.asUrl,placeholder: UIImage(named: "cup"))
    }
}
