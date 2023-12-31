//
//  ProfileViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 26.08.2023.
//

import Foundation
import ToastViewSwift

class ProfileViewModel {
    func updateMe(accessToken: String, fullname: String, email : String) {
        let updateMeRequest = UpdateMeRequest(accessToken: keyChain.get("access_token")!, fullname: fullname, email: email)
        let service = NetworkManager()
        service.requestWithAlamofire(for: updateMeRequest){ [weak self] result in
            guard let self = self else { return }
            switch(result) {
                
            case.success(let response):
                print(response)
                let toast = Toast.text("Succesfully changed your creditionals")
                toast.show()
                
            case.failure(let error):
                print(error.localizedDescription)
                let toast = Toast.text("An error acquired")
                toast.show()
            }
        }
    }
}
