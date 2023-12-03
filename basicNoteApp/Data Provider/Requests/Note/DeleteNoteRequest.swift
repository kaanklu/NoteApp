//
//  DeleteNoteRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 14.08.2023.
//

import Foundation

struct DeleteNoteRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<Notes>

    var path: String = ""
    var method: RequestMethod = .delete
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String, noteId:String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        path = "notes/\(noteId)"
    }
}
