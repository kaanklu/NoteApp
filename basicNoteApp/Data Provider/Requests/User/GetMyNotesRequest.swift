//
//  GetMyNotesRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 7.08.2023.
//

import Foundation

struct GetMyNotesRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<Notes>

    var path: String = "users/me/notes"
    var method: RequestMethod = .get
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String, pageNumber: String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        parameters["page"] = "\(pageNumber)"
    }
}
