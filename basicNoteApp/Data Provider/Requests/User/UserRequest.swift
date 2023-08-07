//
//  UserRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 7.08.2023.
//

import Foundation

struct UserRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<User>

    var path: String = "users/me"
    var method: RequestMethod = .get
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String) {
        headers["Authorization"] = "Bearer \(accessToken)"
    }
}
