//
//  CompetitionsMapper.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation
import CoreData

import Foundation
import CoreData

// MARK: - CompetitionMapper Protocol
protocol CompetitionMapper {
    func mapToEntity(competition: Competition, context: NSManagedObjectContext) -> CompetitionEnt
    func mapToModel(entity: CompetitionEnt) -> Competition
}

// MARK: - DefaultCompetitionMapper
final class DefaultCompetitionMapper: CompetitionMapper {
    
    // MARK: - Map Competition Model to Entity
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
            competitionEntity.currentSeason = mapSeasonToEntity(season, context: context)
        }
        
        return competitionEntity
    }
    
    // MARK: - Map Competition Entity to Model
    func mapToModel(entity: CompetitionEnt) -> Competition {
        let season = mapEntityToSeason(entity.currentSeason)
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
    
    // MARK: - Helper Methods for Season Mapping
    private func mapSeasonToEntity(_ season: Season, context: NSManagedObjectContext) -> SeasnEnt {
        let seasonEntity = SeasnEnt(context: context)
        seasonEntity.id = Int64(season.id)
        seasonEntity.startDate = season.startDate
        seasonEntity.endDate = season.endDate
        seasonEntity.currentMatchday = Int64(season.currentMatchday ?? 0)
        return seasonEntity
    }
    
    private func mapEntityToSeason(_ seasonEntity: SeasnEnt?) -> Season? {
        guard let seasonEntity = seasonEntity else { return nil }
        return Season(
            id: Int(seasonEntity.id),
            startDate: seasonEntity.startDate ?? "",
            endDate: seasonEntity.endDate ?? "",
            currentMatchday: Int(seasonEntity.currentMatchday)
        )
    }
}
