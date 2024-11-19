//
//  CompetitionsDetailsModel.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

import Foundation
import Foundation

// MARK: - CompetitionsDetailsResponse Model
struct CompetitionsDetailsResponse: Codable {
    let filters: CompetitionDetailsFilters?
    let resultSet: CompetitionDetailsResultSet?
    let competition: CompetitionDetails?
    let matches: [Match]?
}

// MARK: - CompetitionsDetailsFilters
struct CompetitionDetailsFilters: Codable {
    let season: String?
    let matchday: String?
}

// MARK: - CompetitionsDetailsResultSet
struct CompetitionDetailsResultSet: Codable {
    let count: Int?
    let first: String?
    let last: String?
    let played: Int?
}

// MARK: - CompetitionsDetails
struct CompetitionDetails: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let type: String?
    let emblem: String?
}

// MARK: - CompetitionsDetailsMatch
struct Match: Codable {
    let area: CompetitionDetailsArea?
    let competition: CompetitionDetails?
    let season: CompetitionDetailsSeason?
    let id: Int?
    let utcDate: String?
    let status: String?
    let minute: String?
    let injuryTime: Int?
    let attendance: Int?
    let venue: String?
    let matchday: Int?
    let stage: String?
    let group: String?
    let lastUpdated: String?
    let homeTeam: Team?
    let awayTeam: Team?
    let score: Score?
    let goals: [Goal]?
    let penalties: [Penalty]?
    let bookings: [String]?
    let substitutions: [String]?
    let odds: Odds?
    let referees: [Referee]?
}

// MARK: - CompetitionsDetailsArea
struct CompetitionDetailsArea: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

// MARK: - CompetitionsDetailsSeason
struct CompetitionDetailsSeason: Codable {
    let id: Int?
    let startDate: String?
    let endDate: String?
    let currentMatchday: Int?
    let winner: String?
    let stages: [String]?
}

// MARK: - CompetitionsDetailsTeam
struct Team: Codable {
    let id: Int?
    let name: String?
    let shortName: String?
    let tla: String?
    let crest: String?
    let coach: Coach?
    let leagueRank: Int?
    let formation: String?
    let lineup: [String]?
    let bench: [String]?
}

// MARK: - CompetitionsDetailsCoach
struct Coach: Codable {
    let id: Int?
    let name: String?
    let nationality: String?
}

// MARK: - CompetitionsDetailsScore
struct Score: Codable {
    let winner: String?
    let duration: String?
    let fullTime: ScoreDetails?
    let halfTime: ScoreDetails?
}

// MARK: - CompetitionsDetailsScoreDetails
struct ScoreDetails: Codable {
    let home: Int?
    let away: Int?
}

// MARK: - CompetitionsDetailsGoal
struct Goal: Codable {
    let minute: Int?
    let injuryTime: Int?
    let type: String?
    let team: Team?
    let scorer: Scorer?
    let assist: Scorer?
    let score: ScoreDetails?
}

// MARK: - CompetitionsDetailsScorer
struct Scorer: Codable {
    let id: Int?
    let name: String?
}

// MARK: - CompetitionsDetailsPenalty
struct Penalty: Codable {
    let player: Scorer?
    let team: Team?
    let scored: Bool?
}

// MARK: - CompetitionsDetailsOdds
struct Odds: Codable {
    let homeWin: Double?
    let draw: Double?
    let awayWin: Double?
}

// MARK: - CompetitionsDetailsReferee
struct Referee: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let nationality: String?
}
