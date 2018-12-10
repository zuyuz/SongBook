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
    let text: String
    
    init(id: Int, title: String, author: String, text: String) {
        self.id = id
        self.title = title
        self.author = author
        self.text = text
    }
}
