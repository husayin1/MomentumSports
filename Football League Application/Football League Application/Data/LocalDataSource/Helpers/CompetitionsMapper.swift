//
//  CompetitionsMapper.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation
import CoreData

protocol CompetitionMapper {
    func mapToEntity(competition: Competition, context: NSManagedObjectContext) -> CompetitionEnt
    func mapToModel(entity: CompetitionEnt) -> Competition
}

final class DefaultCompetitionMapper: CompetitionMapper {
    func mapToEntity(competition: Competition, context: NSManagedObjectContext) -> CompetitionEnt {
        let competitionEntity = CompetitionEnt(context: context)
        competitionEntity.id = Int64(competition.id ?? 0)
        competitionEntity.name = competition.name
        competitionEntity.code = competition.code
        competitionEntity.type = competition.type
        competitionEntity.emblem = competition.emblem
        competitionEntity.plan = competition.plan
        competitionEntity.numberOfAvailableSeasons = Int64(competition.numberOfAvailableSeasons ?? 0)
        competitionEntity.lastUpdated = competition.lastUpdated

        if let season = competition.currentSeason {
            let seasonEntity = SeasnEnt(context: context)
            seasonEntity.id = Int64(season.id)
            seasonEntity.startDate = season.startDate
            seasonEntity.endDate = season.endDate
            seasonEntity.currentMatchday = Int64(season.currentMatchday ?? 0)
            competitionEntity.currentSeason = seasonEntity
        }
        return competitionEntity
    }

    func mapToModel(entity: CompetitionEnt) -> Competition {
        let season = entity.currentSeason.map {
            Season(
                id: Int($0.id),
                startDate: $0.startDate ?? "",
                endDate: $0.endDate ?? "",
                currentMatchday: Int($0.currentMatchday)
            )
        }
        return Competition(
            id: Int(entity.id),
            name: entity.name,
            code: entity.code,
            type: entity.type,
            emblem: entity.emblem,
            plan: entity.plan,
            currentSeason: season,
            numberOfAvailableSeasons: Int(entity.numberOfAvailableSeasons),
            lastUpdated: entity.lastUpdated
        )
    }
}

