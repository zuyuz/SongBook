//
//  SongModel.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import Foundation

class SongModel {
    
    let id: Int
    let title: String
    let author: String
    let lyrics: String
    
    init(id: Int, title: String, author: String, lyrics: String) {
        self.id = id
        self.title = title
        self.author = author
        self.lyrics = lyrics
    }
}
