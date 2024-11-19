//
//  AllCompetitionsTableViewCell.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import UIKit

class AllCompetitionsTableViewCell: UITableViewCell {

    @IBOutlet weak var competitionImageView: UIImageView!
    
    @IBOutlet weak var competitionName: UILabel!
    
    @IBOutlet weak var competitionCode: UILabel!
    
    @IBOutlet weak var competitionAvailableSeasons: UILabel!
    
    @IBOutlet weak var competitionCurrentMatchday: UILabel!
    
    func setupCell(with: Competetion){
        
    }
}
