//
//  CompetitionsDetailsTableViewCell.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import UIKit
import Kingfisher

final class CompetitionsDetailsTableViewCell: UITableViewCell {
        
    //MARK: - Outlets
    @IBOutlet weak private var homeTeamImageView: UIImageView!
    @IBOutlet weak private var homeTeamNameLabel: UILabel!
    @IBOutlet weak private var matchStatusLabel: UILabel!
    @IBOutlet weak private var awayTeamImageView: UIImageView!
    @IBOutlet weak private var awayTeamNameLabel: UILabel!
    
    // MARK: - Initializer
    init() {
        super.init(style: .default, reuseIdentifier: Self.identifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Public Methods
    func configure(with match: Match) {
        setupLabels(with: match)
        loadImages(for: match)
    }
    
    // MARK: - Private Methods
    private func setupLabels(with match: Match) {
        homeTeamNameLabel.text = match.homeTeam?.shortName ?? "N/A"
        matchStatusLabel.text = match.status ?? "Unknown"
        awayTeamNameLabel.text = match.awayTeam?.shortName ?? "N/A"
    }
    
    private func loadImages(for match: Match) {
        let placeholder = UIImage(named: "cup")
        DefaultImageLoader.loadImage(from: match.homeTeam?.crest?.asUrl, into: homeTeamImageView, placeholder: placeholder)
        DefaultImageLoader.loadImage(from: match.awayTeam?.crest?.asUrl, into: awayTeamImageView, placeholder: placeholder)
    }
}
