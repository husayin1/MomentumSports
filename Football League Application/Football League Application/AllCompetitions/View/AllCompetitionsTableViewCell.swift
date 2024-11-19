//
//  AllCompetitionsTableViewCell.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import UIKit
import Kingfisher

class AllCompetitionsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: AllCompetitionsTableViewCell.self)
    
    @IBOutlet weak private var competitionImageView: UIImageView!
    
    @IBOutlet weak private var competitionName: UILabel!
    
    @IBOutlet weak private var competitionCode: UILabel!
    
    @IBOutlet weak private var competitionAvailableSeasons: UILabel!
    
    @IBOutlet weak private var competitionCurrentMatchday: UILabel!
    
    func setupCell(with competition: Competition){
        self.competitionName.text = competition.name
        self.competitionCode.text = competition.code
        self.competitionAvailableSeasons.text = String(describing: competition.numberOfAvailableSeasons ?? 0)
        self.competitionCurrentMatchday.text = String(describing: competition.currentSeason?.currentMatchday ?? 0)
        self.competitionImageView.kf.setImage(with: competition.emblem?.asUrl,placeholder: UIImage(named: "cup"))
    }
}
