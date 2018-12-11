//
//  SongProxy.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/11/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import CoreData

class SongProxy: BaseCoreDataProxy {

    func fetchSongs() -> [Song] {
        guard let questions = executeFetchRequest(NSFetchRequest<NSFetchRequestResult>(entityName: EntityConstants.song)) as? [Song] else {
            return []
        }
        
        return questions
    }
    
    private func deleteOldRecords(from context: NSManagedObjectContext) {
        let request: NSFetchRequest<Song> = Song.fetchRequest()
        do {
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: request as! NSFetchRequest<NSFetchRequestResult>)
            try context.execute(deleteRequest)
        }
        catch {
            NSLog("Failed to remove song records")
        }
    }
    
    private func fetchQuestion(by id: Int, from context: NSManagedObjectContext) -> Song? {
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: EntityConstants.song)
        fetch.predicate = NSPredicate(format: "id == \(id)")
        var fetchedSongs = [Song]()
        do {
            if let fetchedData = try context.fetch(fetch) as? [Song] {
                fetchedSongs = fetchedData
            }
        }
        catch { NSLog("Failed to fetch data from CoreData: \(error)") }
        
        return fetchedSongs.first
    }
}
