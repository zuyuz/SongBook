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
    
    func addSongs(from array: [SongData]) {
        let container = self.persistentContainer
        container.performBackgroundTask() { (context) in
            self.deleteOldRecords(from: context)
            
            for item in array {
                let song = self.fetchSong(by: item.id, from: context) ?? Song(context: context)
                song.id = Int32(item.id)
                song.title = item.title
                song.author = item.author
                song.lyrics = item.lyrics
            }
            
            do { try context.save() }
            catch { NSLog("Failed to save context: \(error)") }
        }
    }
    
    func addSong(_ song: SongModel) {
        let container = self.persistentContainer
        container.performBackgroundTask() { (context) in
            let newSong = self.fetchSong(by: song.id, from: context) ?? Song(context: context)
            newSong.id = Int32(song.id)
            newSong.title = song.title
            newSong.author = song.author
            newSong.lyrics = song.lyrics
        
            do { try context.save() }
            catch { NSLog("Failed to save context: \(error)") }
        }
    }
    
    func updateSong(_ song: SongModel, with newSong: SongModel) {
        let container = self.persistentContainer
        container.performBackgroundTask() { (context) in
            let song = self.fetchSong(by: song.id, from: context) ?? Song(context: context)
            song.id = Int32(newSong.id)
            song.title = newSong.title
            song.author = newSong.author
            song.lyrics = newSong.lyrics
            
            do { try context.save() }
            catch { NSLog("Failed to save context: \(error)") }
        }
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
    
    private func fetchSong(by id: Int, from context: NSManagedObjectContext) -> Song? {
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
