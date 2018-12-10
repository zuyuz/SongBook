//
//  SongListBuilder.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class SongListBuilder {
    
    func createController() -> SongListViewController {
        let vc = SongListViewController()
        let songsVM = SongListViewModel(delegate: vc)
        vc.viewModel = songsVM
        let dataSource = SongListTableViewDataSource(with: songsVM)
        vc.tableDataSource = dataSource
        
        return vc
    }
}
