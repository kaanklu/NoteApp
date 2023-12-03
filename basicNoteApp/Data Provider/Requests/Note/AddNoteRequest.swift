//
//  AddNoteRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 20.08.2023.
//

import Foundation

struct AddNoteRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<Note>

    var path: String = "notes"
    var method: RequestMethod = .post
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String, title: String, note: String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        parameters["title"] = title
        parameters["note"] = note
        
    }
}
