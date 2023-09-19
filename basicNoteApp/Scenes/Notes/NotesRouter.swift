//
//  RegisterRouter.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 1.09.2023.
//

import UIKit

final class NotesRouter: Router, NotesRouter.Routes {
    typealias Routes = ProfileRoute & AddnoteRoute & EditNoteRoute
}
