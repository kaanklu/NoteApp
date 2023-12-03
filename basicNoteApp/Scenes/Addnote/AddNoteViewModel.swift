//
//  AddNoteViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 20.08.2023.
//

import Foundation
import UIKit

class AddNoteViewModel {
    func editNote(title:String, note:String) {
        let addNoteRequest = AddNoteRequest(accessToken: keyChain.get("access_token")!, title: title, note: note)
        let service = NetworkManager()
        service.requestWithAlamofire(for: addNoteRequest){ [weak self] result in
            guard let self = self else { return }
            switch(result) {
            case.success(let response):
                print(response.message as Any)
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
