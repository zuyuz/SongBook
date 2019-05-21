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
        controller.navigationController?.isNavigationBarHidden = false
        controller.navigationController?.navigationItem.leftBarButtonItem = nil
        controller.view.backgroundColor = .white
        controller.title = "Songs"
        addTableView()
        addLogoutButton()
    }
    
    private func addTableView() {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = .zero
        tableView.backgroundColor = .clear
        tableView.isMultipleTouchEnabled = false
        controller.view.addSubview(tableView)
        tableView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.top.equalToSuperview()
            maker.height.equalTo(UIScreen.main.bounds.height * 0.82)
        }
        
        controller.tableView = tableView
    }
    
    private func addLogoutButton() {
        guard controller.logoutButton == nil else { return }
        let button = UIButton(type: .system)
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont(name: "SFUIText-Bold", size: 23)
        
        controller.view.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.width.equalTo(UIScreen.main.bounds.height * 0.228)
            maker.leading.equalToSuperview().offset(UIScreen.main.bounds.width * 0.032)
            maker.top.equalTo(controller.tableView.snp.bottom).offset(UIScreen.main.bounds.height * 0.06)
        }
        
        controller.logoutButton = button
    }
}
