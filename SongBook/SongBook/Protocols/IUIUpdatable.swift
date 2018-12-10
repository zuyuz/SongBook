//
//  IUIUpdatable.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/10/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import Foundation

protocol IUIUpdatable: class {
    func updateUI()
    func addSpinner()
    func removeSpinner()
}
