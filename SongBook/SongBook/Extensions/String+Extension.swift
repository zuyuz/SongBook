//
//  String+Extension.swift
//  SongBook
//
//  Created by JuliaZvizlo on 12/11/18.
//  Copyright © 2018 Mrrrnyaaa. All rights reserved.
//

import Foundation

extension String {
    
    var isEmpty: Bool {
        return self.removingWhitespaces() == ""
    }
    
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespacesAndNewlines).joined()
    }
}
