//
//  SongListTableViewDelegate.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/11/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import UIKit

class SongListTableViewDelegate: NSObject, UITableViewDelegate {
    
    var chooseSong: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        chooseSong?(indexPath.row)
    }
}
