//
//  AllCompetitionsModel.swift
//  Football League Application
//
//  Created by husayn on 18/11/2024.
//

import Foundation


struct CompetetionsResponse: Codable {
    let count: Int
    let competetions: [Competetion]
}

struct Competetion: Codable {
    let id: Int
    let area: Area
    let name: String
    let code: String
    let emblemUrl: String
    let plan: String
    let currentSeason: CurrentSeason
    let numberOfAvailableSeasons: Int
    let lastUpdated: String
}

struct Area: Codable {
    let id: Int
    let name: String
    let countryCode: String
}

struct CurrentSeason: Codable {
    let id: Int
    let startDate: String
    let endDate: String
    let currentMatchday: Int
}
