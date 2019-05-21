//
//  AuthManager.swift
//  SongBook
//
//  Created by Julia Zvizlo on 5/21/19.
//  Copyright © 2019 Mrrrnyaaa. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseUI

class AuthManager {
    
    static let shared = AuthManager()
    private init() {
        self.auth = Auth.auth()
    }
    
    fileprivate(set) var auth: Auth?
    fileprivate(set) var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    func isLocalTokenValid() -> Bool {
        var check = true
        
        self.authStateListenerHandle = self.auth?.addStateDidChangeListener { (auth, user) in
            check = (user != nil)
        }
        
        return check
    }
}
