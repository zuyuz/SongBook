//
//  HomeScreenInitializer.swift
//  SongBook
//
//  Created by JuliaZvizlo on 11/24/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class HomeScreenInitializer: IInitializer {

    private unowned var controller: HomeViewController
    
    init(viewController: HomeViewController) {
        controller = viewController
    }
    
    func initialize() {
        controller.view.backgroundColor = .white
        controller.navigationController?.isNavigationBarHidden = true
    }
}
