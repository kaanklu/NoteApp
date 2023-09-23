//
//  ChangePasswordViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 25.08.2023.
//

import Foundation
import ToastViewSwift

class ChangePasswordViewModel {
    let networkManager = NetworkManager()
    
    func changePasswordRequest(password: String, newPassword: String, retypePassword: String, accessToken: String) {
        let changePasswordRequest = ChangePasswordRequest(password: password, newPassword: newPassword, retypePassword: retypePassword, accessToken: accessToken)
        
        networkManager.requestWithAlamofire(for: changePasswordRequest){ [weak self] result in
            guard let self = self else { return }
            switch(result) {
                
            case.success(let response):
                print(response)
                let toast = Toast.text("Succesfully changed your password")
                toast.show()
                
            case.failure(let error):
                print(error.localizedDescription)
                let toast = Toast.text("Passwords do not match.")
                toast.show()
                
            }
        }
    }
}
