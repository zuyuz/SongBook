//
//  BaseCoreDataProxy.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/11/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import CoreData

struct EntityConstants {
    static let song = "Song"
}

class BaseCoreDataProxy {
    
    private var manager = CoreDataManager.shared
    
    lazy var managedContext: NSManagedObjectContext = {
        let context = self.persistentContainer.viewContext
        return context
    }()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = manager.persistentContainer
        return container
    }()
    
    func save() {
        manager.saveContext()
    }
    
    func executeFetchRequest(_ fetchReq: NSFetchRequest<NSFetchRequestResult>) -> [Any] {
        let moc = self.managedContext
        do {
            let fetchedObjects = try moc.fetch(fetchReq)
            return fetchedObjects as [Any]
        } catch {
            fatalError("Failed to fetch data from CoreData: \(error)")
        }
        return []
    }
}
