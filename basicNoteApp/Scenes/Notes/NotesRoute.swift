//
//  NotesRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 1.09.2023.
//

import UIKit

protocol NotesRoute {
    func placeOnMainVC()
}

extension NotesRoute where Self: RouterProtocol {
    func placeOnMainVC() {
        let router = NotesRouter()
        let mainViewController = NotesViewController(router: router)
        let navigationController = UINavigationController(rootViewController: mainViewController)
        let transition = PlaceOnWindowTransition()
        
        router.presentingViewController = mainViewController
        
        open(navigationController, transition: transition)
        
    }
}
