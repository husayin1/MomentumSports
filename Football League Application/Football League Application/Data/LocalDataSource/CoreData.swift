//
//  CoreData.swift
//  Football League Application
//
//  Created by husayn on 20/11/2024.
//

import Foundation
import CoreData
import UIKit

protocol CoreDataManager {
    var context: NSManagedObjectContext { get }
    func saveContext()
}

class DataManager: CoreDataManager {
    lazy var context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Unable to retrieve AppDelegate")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
    func saveContext() {
        do {
            try context.save()
            print("Context saved successfully.")
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}
