//
//  SongListViewController.swift
//  SongBook
//
//  Created by JuliaZvizlo on 11/24/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class SongListViewController: InitializableViewController {
    
    private var spinner: UIActivityIndicatorView?
    
    var tableView: UITableView!
    var tableDataSource: SongListTableViewDataSource!
    
    var viewModel: SongListViewModel!
    
    lazy var uiInilializer: SongListInitializer = { [unowned self] in
        let initializer = SongListInitializer(viewController: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInilializer.initialize()
        tableView.dataSource = tableDataSource
    }
}

extension SongListViewController: IUIUpdatable {
    func updateUI() {
        tableView.reloadData()
    }
    
    func addSpinner() {
        spinner = UIActivityIndicatorView(style: .gray)
        spinner?.frame = view.bounds
        spinner?.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        spinner?.hidesWhenStopped = true
        spinner?.startAnimating()
        if spinner != nil {
            view.addSubview(spinner!)
        }
    }
    
    func removeSpinner() {
        spinner?.stopAnimating()
        spinner?.removeFromSuperview()
    }
}
