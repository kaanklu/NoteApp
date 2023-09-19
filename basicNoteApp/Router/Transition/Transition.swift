//
//  Transition.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.08.2023.
//

import UIKit

protocol Transition: AnyObject {
    var viewController: UIViewController? { get set }

    func open(_ viewController: UIViewController)
    func close(_ viewController: UIViewController)
}
