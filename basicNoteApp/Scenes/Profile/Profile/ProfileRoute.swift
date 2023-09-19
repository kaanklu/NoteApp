//
//  ProfileRoute.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 3.09.2023.
//

import UIKit

final class ProfileRouter: Router, ProfileRouter.Routes {
    typealias Routes = NotesRoute & ChangePasswordRoute & LoginRoute
}
