//
//  EditNoteViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 17.08.2023.
//

import Foundation
import UIKit


class EditNoteViewModel {
    
    func editNote(noteId:String, title:String, note:String) {
        let updateNoteRequest = EditNoteRequest(accessToken: keyChain.get("access_token")!, noteId: noteId, title: title, note: note)
        let service = NetworkManager()
        service.requestWithAlamofire(for: updateNoteRequest){ [weak self] result in
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
