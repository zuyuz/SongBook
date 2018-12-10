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
    }
    
    func song(at indexPath: IndexPath) -> SongModel? {
        guard songsCount > 0 else { return nil }
        return songs[indexPath.row]
    }
}
