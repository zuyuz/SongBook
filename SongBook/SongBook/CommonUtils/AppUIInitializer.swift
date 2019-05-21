//
//  AppUIInitializer.swift
//  SongBook
//
//  Created by Julia Zvizlo on 5/21/19.
//  Copyright © 2019 Mrrrnyaaa. All rights reserved.
//

import UIKit

class AppUIInitializer: IInitializer {

    func initialize() {
        if AuthManager.shared.isLocalTokenValid() {
            SongBookNavigationHandler().showMainAppFlow()
        } else {
            SongBookNavigationHandler().showLoginFlow()
        }
    }
}
