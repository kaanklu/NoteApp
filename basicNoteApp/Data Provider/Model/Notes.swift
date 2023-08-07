//
//  Notes.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation

struct Notes: Decodable {
    let currentPage: Int?
    let perPage: Int?
    let data: [Note]
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case perPage = "per_page"
        case data
    }
}

struct Note: Decodable {
    let id: Int?
    let title: String?
    let note: String?
}
