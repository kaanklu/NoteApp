//
//  RegisterViewModal.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 18.07.2023.
//

import Foundation
import KeychainSwift
let keyChain = KeychainSwift()
class RegisterViewModel {
    let networkManager = NetworkManager()
    func registerRequest(name:String, email:String, password:String) {
       let registerRequest = RegisterRequest(fullName: name, email: email, password: password)
        networkManager.requestWithAlamofire(for: registerRequest){ [weak self] result in
            guard let self = self else { return }
            switch(result) {
            case.success(let response):
                keyChain.set((response.data?.accessToken)!, forKey: "access_key")
                print(response.message as Any)
                print("keychain added -> \(keyChain.allKeys)")
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}









