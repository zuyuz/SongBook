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
    
    private var songView: SongView?
    
    lazy var uiInilializer: SongListInitializer = { [unowned self] in
        let initializer = SongListInitializer(viewController: self)
        return initializer
    }()
    
    lazy var cancelSong: (() -> Void) = { [weak self] in
        self?.songView?.removeFromSuperview()
        self?.songView = nil
        self?.showNavigationBar()
    }
    
    lazy var saveSong: ((SongModel, String?) -> Void) = { [weak self] song, buttonTitle in
        guard let check = self?.validate(song) else { return }
        if check {
            buttonTitle == "Create" ? self?.create(song) : self?.save(song)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInilializer.initialize()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSongButtonClicked(_:)))
        tableView.dataSource = tableDataSource
        viewModel.loadSongsFromCoreData()
    }
    
    @objc func addSongButtonClicked(_ sender: UIButton) {
        hideNavigationBar()
        showSongView()
    }
    
    private func showSongView() {
        songView = SongView()
        guard songView != nil else { return }
        self.view.addSubview(songView!)
        songView!.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        songView!.setupSubviews()
        songView!.cancelSong = cancelSong
        songView!.saveSong = saveSong
        self.view.bringSubviewToFront(songView!)
        songView!.titleTextField.becomeFirstResponder()
    }
    
    private func validate(_ song: SongModel) -> Bool {
        guard songView != nil else { return false }
        guard let title = songView!.titleTextField.text else { return false }
        
        let trimmedTitle = title.removingWhitespaces()
        
        let error = "Field cannot be empty"
        
        if trimmedTitle.isEmpty {
            songView!.titleTextField.attributedPlaceholder = NSAttributedString(string: error, attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            return false
        }
        
        return true
    }
    
    private func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    private func save(_ song: SongModel) {
        
    }
    
    private func create(_ song: SongModel) {
        guard songView != nil else { return }
        viewModel.addNewSong(song)
        songView!.removeFromSuperview()
        songView = nil
        showNavigationBar()
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
