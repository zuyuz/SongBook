//
//  SongModel.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import Foundation

class SongModel {
    
    var id: Int
    var title: String
    var author: String
    var lyrics: String
    
    init(id: Int, title: String, author: String, lyrics: String) {
        self.id = id
        self.title = title
        self.author = author
        self.lyrics = lyrics
    }
}
