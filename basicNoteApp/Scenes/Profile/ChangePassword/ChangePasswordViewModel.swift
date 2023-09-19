//
//  ChangePasswordViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 25.08.2023.
//

import Foundation

class ChangePasswordViewModel {
    let networkManager = NetworkManager()
    func changePasswordRequest(password: String, newpassword: String, retypepassword: String, accessToken: String) {
       let changePasswordRequest = ChangePasswordRequest(password: password, newpassword: newpassword, retypepassword: retypepassword, accessToken: accessToken)
        networkManager.requestWithAlamofire(for: changePasswordRequest){ [weak self] result in
            guard let self = self else { return }
            switch(result) {
            case.success(let response):
                print(response)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
