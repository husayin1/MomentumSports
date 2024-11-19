//
//  AllCompetitionsModel.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import Foundation


struct CompetitionResponse: Decodable {
    let count: Int
    let filters: [String: String]
    let competitions: [Competition]
}

struct Competition: Decodable {
    let id: Int?
    let area: Area?
    let name: String?
    let code: String?
    let type: String?
    let emblem: String?
    let plan: String?
    let currentSeason: Season?
    let numberOfAvailableSeasons: Int?
    let lastUpdated: String?
}


struct Area: Decodable {
    let id: Int
    let name: String
    let code: String
    let flag: String?
}

struct Season: Decodable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int?
    let winner: Winner?
}

struct Winner: Decodable {
    let id: Int
    let name: String
}
