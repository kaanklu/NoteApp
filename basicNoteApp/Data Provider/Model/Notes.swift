//
//  Notes.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation

struct Notes: Decodable {
    var currentPage: Int?
    var perPage: Int?
    var data: [Note]
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case perPage = "per_page"
        case data
    }
}

struct Note: Decodable {
    var id: Int?
    var title: String?
    var note: String?
}
