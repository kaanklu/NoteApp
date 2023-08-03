//
//  LoginModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 18.07.2023.
//

import Foundation

struct LoginModel: Encodable {
    let email:String
    let password:String
    
}

struct LoginResponse: Decodable {
    let code : String
    let data : DataClassforLogin
    let message : String
}

struct DataClassforLogin: Codable {
    let access_token : String
    let token_type : String
    
}
