//
//  RegisterRouter.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 1.09.2023.
//

import UIKit

final class RegisterRouter: Router, RegisterRouter.Routes {
    typealias Routes = LoginRoute & ForgotPasswordRoute & NotesRoute
}
