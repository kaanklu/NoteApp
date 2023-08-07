//
//  NetworkManagerProtocol.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func requestWithAlamofire<T: RequestProtocol>(for request: T, result: ((Result<T.ResponseType, Error>) -> Void)?)
    
}
