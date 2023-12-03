//
//  AddNoteRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 12.09.2023.
//

import UIKit

protocol AddnoteRoute {
    func placeOnAddNoteVC()
}

extension AddnoteRoute where Self: RouterProtocol {
    func placeOnAddNoteVC() {
        let router = AddNoteRouter()
        let mainViewController = AddNoteViewController(router: router)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        let transition = PlaceOnWindowTransition()
        
        router.presentingViewController = mainViewController
        
        open(navigationController, transition: transition)
        
    }
}
