//
//  NotesViewModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 23.07.2023.
//

import Foundation
import UIKit


class NotesViewModel {
    var onDataReceived: ((Notes) -> Void)?
    func getMyNotes() {
        let getMyNoteRequest = GetMyNotesRequest(accessToken: keyChain.get("access_token")!, pageNumber: "1")
        let service = NetworkManager()
        service.requestWithAlamofire(for: getMyNoteRequest){ [weak self] result in
            guard let self = self else { return }
            switch(result) {
            case.success(let response):
                print("----------------------------------------")
                if let responseData = response.data {
                    self.onDataReceived?(responseData)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteMyNote(noteId:String) {
        let deleteMyNoteRequest = DeleteNoteRequest(accessToken: keyChain.get("access_token")!, noteId: noteId)
        let service = NetworkManager()
        service.requestWithAlamofire(for: deleteMyNoteRequest) { [weak self] result in
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


