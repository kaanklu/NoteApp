//
//  Auth.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation

struct Auth: Decodable {
    let accessToken: String?
    let tokenType: String?
 
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        
    }
}
