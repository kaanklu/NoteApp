//
//  ProfileRouter.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 3.09.2023.
//

import UIKit

protocol ProfileRoute {
    func placeOnProfileViewController()
}

extension ProfileRoute where Self: RouterProtocol {
    
    func placeOnProfileViewController() {
        let router = ProfileRouter()
        let profileViewController = ProfileViewController(router: router)
        let navigationController = UINavigationController(rootViewController: profileViewController)
        let transition = PlaceOnWindowTransition()
        
        router.presentingViewController = profileViewController
        
        open(navigationController, transition: transition)
    }
}
