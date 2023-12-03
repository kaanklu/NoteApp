//
//  ChangePassword.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 25.08.2023.
//

import Foundation

struct ChangePasswordRequest: RequestProtocol {
    
    typealias ResponseType = BaseResponse<Auth>

    var path: String = "users/me/password"
    var method: RequestMethod = .put
    var parameters: RequestParameters = [:]
    var headers: RequestHeaders = [:]

    init(password: String, newPassword: String, retypePassword : String, accessToken: String) {
        headers["Authorization"] = "Bearer \(accessToken)"
        parameters["new_password"] = newPassword
        parameters["password"] = password
        parameters["new_password_confirmation"] = retypePassword

    }
}
