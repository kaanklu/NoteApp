//
//  Router.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.08.2023.
//

import UIKit

protocol RouterProtocol: AnyObject {
    func open(_ viewController: UIViewController, transition: Transition)
    func close()
}

class Router: RouterProtocol {
    
    weak var presentingViewController: UIViewController?
    var openTransition: Transition?

    func open(_ viewController: UIViewController, transition: Transition) {
        transition.viewController = self.presentingViewController
        transition.open(viewController)
    }

    func close() {
        guard let openTransition = openTransition else {
            assertionFailure("You should specify an open transition in order to close a module.")
            return
        }
        guard let viewController = presentingViewController else {
            assertionFailure("Nothing to close.")
            return
        }
        openTransition.close(viewController)
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
}





