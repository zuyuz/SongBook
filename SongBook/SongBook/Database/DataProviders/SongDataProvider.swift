//
//  SongDataProvider.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/11/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import FirebaseDatabase

struct SongData {
    let id: Int
    let title: String
    let author: String
    let lyrics: String
}

class SongDataProvider {
    
    func fetchSongsFromFirebase() {
        let ref = Database.database().reference().root.child("songs")
        ref.observeSingleEvent(of: .value, with: { snapshot in
            if snapshot.exists() {
                let songs = self.parseSongs(from: snapshot)
                SongProxy().addSongs(from: songs)
            }
        })
    }
    
    func add(_ song: SongModel) {
        let ref = Database.database().reference().root.child("songs").child(String(song.id))
        ref.setValue(["title": song.title,
                      "author": song.author,
                      "lyrics": song.lyrics])
        SongProxy().addSong(song)
    }
    
    private func parseSongs(from snapshot: DataSnapshot) -> [SongData] {
        var songs: [SongData] = []
        for index in 1...snapshot.childrenCount {
            let id = Int(index)
            let stringId = String(index)
            let data = snapshot.childSnapshot(forPath: stringId)
            
            var songTitle = ""
            if let title = data.childSnapshot(forPath: "title").value as? String {
                songTitle = title
            }
            
            var songAuthor = ""
            if let author = data.childSnapshot(forPath: "author").value as? String {
                songAuthor = author
            }
            
            var songLyrics = ""
            if let lyrics = data.childSnapshot(forPath: "lyrics").value as? String {
                songLyrics = lyrics
            }
            
            songs.append(SongData(id: id, title: songTitle, author: songAuthor, lyrics: songLyrics))
        }
        
        return songs
    }
}
