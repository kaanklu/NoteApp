//
//  AddNoteRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 12.09.2023.
//

import UIKit

protocol EditNoteRoute {
    func pushEditNoteVC(note:Note)
}

extension EditNoteRoute where Self: RouterProtocol {
    func pushEditNoteVC(note:Note) {
        let router = EditNoteRouter()
        let editNoteVC = EditNoteViewController(router:router)
        let transition = PushTransition()
        router.presentingViewController = editNoteVC
        editNoteVC.note = note
        
        open(editNoteVC, transition: transition)
        
    }
}
