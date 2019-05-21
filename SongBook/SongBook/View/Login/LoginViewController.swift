//
//  LoginViewController.swift
//  SongBook
//
//  Created by Julia Zvizlo on 5/20/19.
//  Copyright © 2019 Mrrrnyaaa. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseUI

class LoginViewController: UIViewController {
    
    fileprivate(set) var authUI: FUIAuth?
    
    var loginButton: UIButton!
    var backgroundView: UIImageView!
    
    private lazy var uiInilializer: LoginUIInitializer = { [unowned self] in
        let initializer = LoginUIInitializer(viewController: self)
        return initializer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiInilializer.initialize()
        loginButton.addTarget(self, action: #selector(loginButtonClicked(_:)), for: .touchUpInside)
        self.authUI = FUIAuth.defaultAuthUI()
        self.authUI?.delegate = self
        self.authUI?.providers = [FUIEmailAuth()]
    }
    
    @objc private func loginButtonClicked(_ sender: UIButton) {
        let authViewController = authUI?.authViewController();
        self.present(authViewController!, animated: true, completion: nil)
    }
    
    private func navigateToUserProfile() {
        let vc = SongListBuilder().createController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if let authError = error {
            let errorCode = UInt((authError as NSError).code)
            
            switch errorCode {
            case FUIAuthErrorCode.userCancelledSignIn.rawValue:
                print("User cancelled sign-in");
                break
                
            default:
                let detailedError = (authError as NSError).userInfo[NSUnderlyingErrorKey] ?? authError
                print("Login error: \((detailedError as! NSError).localizedDescription)");
            }
        } else {
            navigateToUserProfile()
        }
    }
}
