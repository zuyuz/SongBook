//
//  HomeViewController.swift
//  SongBook
//
//  Created by JuliaZvizlo on 11/24/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class HomeViewController: InitializableViewController {

    lazy var uiInilializer: HomeScreenInitializer = { [unowned self] in
        let initializer = HomeScreenInitializer(viewController: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInilializer.initialize()
    }
}
