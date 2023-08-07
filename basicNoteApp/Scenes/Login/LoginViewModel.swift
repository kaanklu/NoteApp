//
//  LoginViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 6.08.2023.
//

import Foundation

class LoginViewModel {
    let networkManager = NetworkManager()
    func loginRequest(email:String, password:String) {
        let loginRequest = LoginRequest(email: email, password: password)
        
        networkManager.requestWithAlamofire(for: loginRequest) { [weak self] result in
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
