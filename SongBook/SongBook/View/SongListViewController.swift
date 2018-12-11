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
    var tableDelegate: SongListTableViewDelegate!
    
    var viewModel: SongListViewModel!
    
    private var songView: SongView?
    
    private lazy var uiInilializer: SongListInitializer = { [unowned self] in
        let initializer = SongListInitializer(viewController: self)
        return initializer
    }()
    
    private lazy var cancelSong: (() -> Void) = { [weak self] in
        self?.songView?.removeFromSuperview()
        self?.songView = nil
        self?.showNavigationBar()
    }
    
    private lazy var saveSong: ((SongModel, String?) -> Void) = { [weak self] song, buttonTitle in
        guard let check = self?.validate(song) else { return }
        if check {
            buttonTitle == "Create" ? self?.create(song) : self?.save(song)
        }
    }
    
    private lazy var chooseSong:((Int) -> Void) = { [weak self] number in
        guard let chosenSong = self?.viewModel.song(at: number) else { return }
        self?.showActionSheet(for: chosenSong)
    }
    
    private lazy var editSong: ((SongModel) -> Void) = { [weak self] song in
        
    }
    
    private lazy var deleteSong: ((SongModel) -> Void) = { [weak self] song in
        
    }
    
    private lazy var downloadSong: ((SongModel) -> Void) = { [weak self] song in
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInilializer.initialize()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSongButtonClicked(_:)))
        tableView.dataSource = tableDataSource
        tableView.delegate = tableDelegate
        tableDelegate.chooseSong = chooseSong
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
    
    private func showActionSheet(for song: SongModel) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let editSongAction = UIAlertAction(title: "Edit", style: .default, handler: { _ in
            self.editSong(song)})
        let downloadSongAction = UIAlertAction(title: "Download", style: .default, handler: { _ in
            self.downloadSong(song)})
        let deleteSongAction = UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            self.deleteSong(song)})
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(editSongAction)
        alert.addAction(downloadSongAction)
        alert.addAction(deleteSongAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
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
