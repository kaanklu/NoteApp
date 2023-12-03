//
//  AppRouter.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.08.2023.
//

import UIKit

final class AppRouter: Router, AppRouter.Routes {
    
    typealias Routes = LoginRoute
    
    static let shared = AppRouter()
    
    func startApp() {
        placeOnLoginViewController()
    }
    
}
