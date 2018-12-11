//
//  SongListViewModel.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import Foundation

class SongListViewModel {
    
    private var songs: [SongModel] = [] {
        didSet {
            delegate?.updateUI()
        }
    }
    
    var songsCount: Int {
        return songs.count
    }
    
    private weak var delegate: IUIUpdatable?
    
    init(delegate: IUIUpdatable) {
        self.delegate = delegate
        NotificationCenter.default.addObserver(self, selector: #selector(handleContextDidSaveReceivedData(notification:)), name: .NSManagedObjectContextDidSave, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .NSManagedObjectContextDidSave, object: nil)
    }
    
    func song(at indexPath: IndexPath) -> SongModel? {
        guard songsCount > 0 else { return nil }
        return songs[indexPath.row]
    }
    
    func loadSongsFromCoreData() {
        let dbSongs = SongProxy().fetchSongs()
        var rows: [SongModel] = []
        for index in 0..<dbSongs.count {
            let row = parseSong(from: dbSongs[index])
            rows.insert(row, at: index)
        }
        
        if rows.count > 0 {
            rows.sort(by: {$0.title < $1.title})
            songs = rows
        }
    }
    
    private func parseSong(from data: Song) -> SongModel {
        var songTitle = ""
        if let title = data.title {
            songTitle = title
        }
        
        var songAuthor = ""
        if let author = data.author {
            songAuthor = author
        }
        
        var songLyrics = ""
        if let lyrics = data.lyrics {
            songLyrics = lyrics
        }
        
        let song = SongModel(id: Int(data.id), title: songTitle, author: songAuthor, lyrics: songLyrics)
        
        return song
    }
    
    @objc private func handleContextDidSaveReceivedData(notification: Notification) {
        DispatchQueue.main.async { [weak self] in
            self?.loadSongsFromCoreData()
        }
    }
}
