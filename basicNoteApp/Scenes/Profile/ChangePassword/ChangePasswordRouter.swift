//
//  ChangePasswordRouter.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 3.09.2023.
//
import UIKit

protocol ChangePasswordRoute {
    func placeOnChangePasswordViewController()
}

extension ChangePasswordRoute where Self: RouterProtocol {
    
    func placeOnChangePasswordViewController() {
        let router = ChangePasswordRouter()
        let changePasswordViewController = ChangePasswordViewController(router: router)
        let navigationController = UINavigationController(rootViewController: changePasswordViewController)
        let transition = PlaceOnWindowTransition()
        
        router.presentingViewController = changePasswordViewController
        
        open(navigationController, transition: transition)
    }
}
