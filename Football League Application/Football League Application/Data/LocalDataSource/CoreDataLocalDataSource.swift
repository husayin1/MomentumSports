//
//  DataBase.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation
import CoreData

final class CoreDataLocalDataSource: LocalDataSource {
    private let coreDataManager: CoreDataManager = DataManager()
    private let mapper: CompetitionMapper = DefaultCompetitionMapper()

    
    
    func saveCompetitions(_ competitions: [Competition]) {
        for competition in competitions {
            _ = mapper.mapToEntity(competition: competition, context: coreDataManager.context)
        }
        coreDataManager.saveContext()
    }

    func getCompetitions() -> [Competition] {
        let fetchRequest: NSFetchRequest<CompetitionEnt> = CompetitionEnt.fetchRequest()
        do {
            let entities = try coreDataManager.context.fetch(fetchRequest)
            return entities.map { mapper.mapToModel(entity: $0) }
        } catch {
            print("Error fetching competitions: \(error.localizedDescription)")
            return []
        }
    }

    func deleteCompetitions() {
        let fetchRequest: NSFetchRequest<CompetitionEnt> = CompetitionEnt.fetchRequest()
        do {
            let competitionEntities = try coreDataManager.context.fetch(fetchRequest)
            for competitionEntity in competitionEntities {
                if let seasonEntity = competitionEntity.currentSeason {
                    coreDataManager.context.delete(seasonEntity)
                }
                coreDataManager.context.delete(competitionEntity)
            }
            coreDataManager.saveContext()
            print("All competitions and related seasons deleted successfully.")
            
        } catch {
            print("Error deleting competitions and seasons: \(error.localizedDescription)")
        }
    }

}
