//
//  BaseResponse.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let data: T?
    let message: String?
    let code: String?
}

struct ErrorResponse: Decodable,Error {
  let code: String
  let message: String
}
