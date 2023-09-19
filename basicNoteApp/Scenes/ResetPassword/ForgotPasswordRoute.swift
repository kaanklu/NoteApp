//
//  RegisterRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 1.09.2023.
//

import UIKit

protocol ForgotPasswordRoute {
    func pushForgotPasswordViewController()
}

extension ForgotPasswordRoute where Self: RouterProtocol {
    
    func pushForgotPasswordViewController() {
        let router = ForgotPasswordRouter()
        let forgotPasswordVC = ForgotPasswordViewController(router: router)
        let transition = PushTransition()
        
        router.presentingViewController = forgotPasswordVC

        open(forgotPasswordVC, transition: transition)
    }
}
