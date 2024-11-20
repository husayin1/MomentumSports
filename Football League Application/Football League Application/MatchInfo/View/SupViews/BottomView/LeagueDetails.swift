//
//  LeagueDetails.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import UIKit

final class LeagueDetails: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak private var competitionImageView: UIImageView!
    @IBOutlet weak private var competitionNameLabel: UILabel!
    @IBOutlet weak private var competitionAreaLabel: UILabel!
    
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
        Bundle.main.loadNibNamed("LeagueDetails", owner: self)
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        containerView.frame = self.bounds
        addSubview(containerView)
        print("Finish here")
    }
    private func setupTeams(with match: Match){
        competitionNameLabel.text = match.competition?.name ?? "N/A"
        competitionAreaLabel.text = match.area?.name ?? "N/A"
    }
    
    
    private func loadImages(for match: Match){
        let placeholder = UIImage(named: "cup")
        DefaultImageLoader.loadImage(from: match.competition?.emblem?.asUrl, into: competitionImageView, placeholder: placeholder)
    }
    
    
}
