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
    
    var songView: SongView!
    
    lazy var uiInilializer: SongListInitializer = { [unowned self] in
        let initializer = SongListInitializer(viewController: self)
        return initializer
    }()
    
    lazy var cancelSong: (() -> Void) = { [weak self] in
        self?.songView.removeFromSuperview()
        self?.showNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInilializer.initialize()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSongButtonClicked(_:)))
        tableView.dataSource = tableDataSource
    }
    
    @objc func addSongButtonClicked(_ sender: UIButton) {
        hideNavigationBar()
        showSong()
    }
    
    private func showSong() {
        songView = SongView()
        self.view.addSubview(songView)
        songView.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        songView.setupSubviews()
        songView.cancelSong = cancelSong
        self.view.bringSubviewToFront(songView)
        songView.titleTextField.becomeFirstResponder()
    }
    
    private func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
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
