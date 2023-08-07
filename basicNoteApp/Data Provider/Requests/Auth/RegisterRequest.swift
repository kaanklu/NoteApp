//
//  RegisterRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation

struct RegisterRequest: RequestProtocol {
    
    typealias ResponseType = BaseResponse<Auth>

    var path: String = "auth/register"
    var method: RequestMethod = .post
    var parameters: RequestParameters = [:]
    
    init(fullName: String, email: String, password: String) {
        parameters["full_name"] = fullName
        parameters["email"] = email
        parameters["password"] = password
    }
}
