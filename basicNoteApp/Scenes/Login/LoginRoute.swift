//
//  LoginRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.08.2023.
//

import UIKit

protocol LoginRoute {
    func placeOnLoginViewController()
}

extension LoginRoute where Self: RouterProtocol {
    
    func placeOnLoginViewController() {
        let router = LoginRouter()
        let loginViewController = LoginViewController(router: router)
        let navigationController = UINavigationController(rootViewController: loginViewController)
        let transition = PlaceOnWindowTransition()
        
        router.presentingViewController = loginViewController
        
        open(navigationController, transition: transition)
    }
}
