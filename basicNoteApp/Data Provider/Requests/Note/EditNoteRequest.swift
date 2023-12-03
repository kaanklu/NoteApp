//
//  UpdateNoteRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 15.08.2023.
//

import Foundation

struct EditNoteRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<Note>

    var path: String = ""
    var method: RequestMethod = .put
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String, noteId:String, title:String, note:String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        path = "notes/\(noteId)"
        parameters["title"] = title
        parameters["note"] = note
        
        
    }
}
