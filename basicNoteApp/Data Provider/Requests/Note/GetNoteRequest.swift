//
//  GetNoteRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 7.08.2023.
//

import Foundation

struct GetNoteRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<Note>

    var path: String = ""
    var method: RequestMethod = .get
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String, noteId: String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        path = "notes/\(noteId)"
    }
}
