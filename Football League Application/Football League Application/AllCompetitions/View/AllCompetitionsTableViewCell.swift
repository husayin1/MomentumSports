//
//  AllCompetitionsTableViewCell.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import UIKit
import Kingfisher

class AllCompetitionsTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak private var competitionImageView: UIImageView!
    @IBOutlet weak private var competitionName: UILabel!
    @IBOutlet weak private var competitionCode: UILabel!
    @IBOutlet weak private var competitionAvailableSeasons: UILabel!
    @IBOutlet weak private var competitionCurrentMatchday: UILabel!
    
    // MARK: - Configuration Method
      func configure(with competition: Competition) {
          setupLabels(with: competition)
          loadImages(for: competition)
      }
    
    // MARK: - Private Methods
    private func setupLabels(with competition: Competition){
        competitionName.text = competition.name ?? "Unknown Competition"
        competitionCode.text = competition.code ?? "N/A"
        competitionAvailableSeasons.text = "\(competition.numberOfAvailableSeasons ?? 0) Seasons"
        competitionCurrentMatchday.text = "Matchday \(competition.currentSeason?.currentMatchday ?? 0)"
    }
    
    private func loadImages(for competition: Competition){
        DefaultImageLoader.loadImage(from: competition.emblem?.asUrl, into: competitionImageView, placeholder: UIImage(named: "cup"))
    }
    
}
