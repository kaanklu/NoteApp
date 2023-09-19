//
//  LoginRouter.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 30.08.2023.
//

import UIKit

final class LoginRouter: Router, LoginRouter.Routes {
    typealias Routes = RegisterRoute & ForgotPasswordRoute & NotesRoute
}
