//
//  UpdateMeRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 26.08.2023.
//

import Foundation

struct UpdateMeRequest: RequestProtocol {
    
    public typealias ResponseType = BaseResponse<User>

    var path: String = "users/me"
    var method: RequestMethod = .put
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]
    
    init(accessToken: String, fullname: String, email : String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        parameters["full_name"] = fullname
        parameters["email"] = email
    }
}
