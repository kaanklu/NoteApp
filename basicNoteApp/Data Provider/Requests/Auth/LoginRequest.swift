//
//  LoginRequest.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation
struct LoginRequest: RequestProtocol {
    
    typealias ResponseType = BaseResponse<Auth>

    var path: String = "auth/login"
    var method: RequestMethod = .post
    var parameters: RequestParameters = [:]
    
    init(email: String, password: String) {
        parameters["email"] = email
        parameters["password"] = password
    }
}
