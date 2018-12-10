//
//  SongListTableViewDataSource.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class SongListTableViewDataSource: NSObject, UITableViewDataSource {
    
    private unowned let viewModel: SongListViewModel
    
    init(with viewModel: SongListViewModel) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if let song = viewModel.song(at: indexPath) {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.author
        }
        
        return cell
    }
}
