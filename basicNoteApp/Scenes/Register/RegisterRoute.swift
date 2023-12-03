//
//  RegisterRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 1.09.2023.
//

import UIKit

protocol RegisterRoute {
    func placeOnRegisterViewController()
}

extension RegisterRoute where Self: RouterProtocol {
    
    func placeOnRegisterViewController() {
        let router = RegisterRouter()
        let registerViewController = RegisterViewController(router: router)
        let navigationController = UINavigationController(rootViewController: registerViewController)
        let transition = PlaceOnWindowTransition()
        
        router.presentingViewController = registerViewController
        
        open(navigationController, transition: transition)
    }
}
