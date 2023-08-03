//
//  RegisterModel.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 17.07.2023.
//

import Foundation


struct RegisterModel:Encodable {
    let full_name : String
    let email : String
    let password: String

}

struct RegisterResponse: Decodable {
    let code : String
    let data : DataClass
    let message : String
}

struct DataClass: Codable {
    let access_token : String
    let token_type : String
    
}



