//
//  SongBookNavigationHandler.swift
//  SongBook
//
//  Created by Julia Zvizlo on 5/21/19.
//  Copyright © 2019 Mrrrnyaaa. All rights reserved.
//

import UIKit

class SongBookNavigationHandler {
    
    func showLoginFlow() {
        let navController = UINavigationController(rootViewController: LoginViewController())
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    func showMainAppFlow() {
        let window = (UIApplication.shared.delegate as? AppDelegate)?.window
        let vc = SongListBuilder().createController()
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }
}
