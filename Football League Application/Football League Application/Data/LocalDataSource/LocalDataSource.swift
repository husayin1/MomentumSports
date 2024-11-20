//
//  DataBase.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation

protocol LocalDataSource {
    func saveCompetitions(_ competitions: [Competition])
    func getCompetitions() -> [Competition]
    func deleteCompetitions()
}
