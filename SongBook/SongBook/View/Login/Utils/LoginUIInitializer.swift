//
//  LoginUIInitializer.swift
//  SongBook
//
//  Created by Julia Zvizlo on 5/20/19.
//  Copyright © 2019 Mrrrnyaaa. All rights reserved.
//

import UIKit

class LoginUIInitializer: IInitializer {

    private unowned var controller: LoginViewController
    
    init(viewController: LoginViewController) {
        controller = viewController
    }
    
    func initialize() {
        controller.view.backgroundColor = .white
        controller.navigationController?.isNavigationBarHidden = true
        addBackgroundView()
        addLoginButton()
    }
    
    private func addLoginButton() {
        guard controller.loginButton == nil else { return }
        let button = UIButton(type: .system)
        let radius: CGFloat = 4.0
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 30.0 / 255.0, green: 144.0 / 255.0, blue: 255, alpha: 1.0)
        button.layer.cornerRadius = radius
        
        controller.view.addSubview(button)
        button.snp.makeConstraints { maker in
            maker.height.equalTo(UIScreen.main.bounds.height * 0.06)
            maker.width.equalTo(UIScreen.main.bounds.height * 0.154)
            maker.trailing.equalToSuperview().offset(-UIScreen.main.bounds.width * 0.073)
            maker.centerY.equalToSuperview()
        }
        
        controller.loginButton = button
    }
    
    private func addBackgroundView() {
        guard controller.backgroundView == nil else { return }
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "background")
        controller.view.addSubview(view)
        view.snp.makeConstraints { maker in
            maker.leading.equalToSuperview()
            maker.top.equalToSuperview()
            maker.trailing.equalToSuperview()
            maker.bottom.equalToSuperview()
        }
        
        controller.backgroundView = view
        controller.view.sendSubviewToBack(view)
    }
}
