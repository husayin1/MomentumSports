//
//  CompetitionsDetailsModel.swift
//  Football League Application
//
//  Created by husayn on 19/11/2024.
//

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
// MARK: - Root Model
struct Match: Codable {
    let area: AreaC?
    let competition: CompetitionDetails?
    let season: SeasonDetails?
    let id: Int?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
    let group: String?
    let lastUpdated: String?
    let homeTeam: TeamDetails?
    let awayTeam: TeamDetails?
    let score: ScoreDetails?
    let odds: Odds?
    let referees: [Referee]?
}

// MARK: - Area
struct AreaC: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let flag: String?
}

// MARK: - Competition
struct CompetitionDetails: Codable {
    let id: Int?
    let name: String?
    let code: String?
    let type: String?
    let emblem: String?
}

// MARK: - Season
struct SeasonDetails: Codable {
    let id: Int?
    let startDate: String?
    let endDate: String?
    let currentMatchday: Int?
    let winner: WinnerDetails?
}

// MARK: - Winner
struct WinnerDetails: Codable {
    let id: Int?
    let name: String?
    let shortName: String?
    let tla: String?
    let crest: String?
    let address: String?
    let website: String?
    let founded: Int?
    let clubColors: String?
    let venue: String?
    let lastUpdated: String?
}

// MARK: - Team
struct TeamDetails: Codable {
    let id: Int?
    let name: String?
    let shortName: String?
    let tla: String?
    let crest: String?
}

// MARK: - Score
struct ScoreDetails: Codable {
    let winner: String?
    let duration: String?
    let fullTime: MatchResult?
    let halfTime: MatchResult?
    let regularTime: MatchResult?
    let extraTime: MatchResult?
    let penalties: MatchResult?
}

// MARK: - MatchResult
struct MatchResult: Codable {
    let home: Int?
    let away: Int?
}

// MARK: - Odds
struct Odds: Codable {
    let msg: String?
}

// MARK: - Referee
struct Referee: Codable {
    let id: Int?
    let name: String?
    let type: String?
    let nationality: String?
}
