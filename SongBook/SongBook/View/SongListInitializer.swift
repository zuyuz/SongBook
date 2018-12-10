//
//  SongListInitializer.swift
//  SongBook
//
//  Created by JuliaZvizlo on 11/24/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit
import SnapKit

class SongListInitializer: IInitializer {

    private unowned var controller: SongListViewController
    
    init(viewController: SongListViewController) {
        controller = viewController
    }
    
    func initialize() {
        controller.view.backgroundColor = .white
        controller.title = "Songs"
        addTableView()
    }
    
    private func addTableView() {
        let tableView = UITableView()
        tableView.allowsSelection = false
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.backgroundColor = .clear
        tableView.isMultipleTouchEnabled = false
        controller.view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        controller.tableView = tableView
    }
}
