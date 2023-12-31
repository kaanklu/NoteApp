//
//  NetworkManager.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 4.08.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    private func createRequestForAlamofire<T: RequestProtocol>(_ request: T) -> DataRequest {
        var headersForAlamofire: HTTPHeaders = [:]
        request.headers.forEach({ headersForAlamofire[$0.key] = $0.value })
        
        var encoderAlamofire: ParameterEncoding
        switch request.encoding {
        case .json:
            encoderAlamofire = JSONEncoding.default
        case .url:
            encoderAlamofire = URLEncoding.default
        }
        
        let requestAF = AF.request(request.url,
                                   method: HTTPMethod(rawValue: request.method.rawValue),
                                   parameters: request.parameters,
                                   encoding: encoderAlamofire,
                                   headers: headersForAlamofire)
        return requestAF
    }
  
    
    func requestWithAlamofire<T: RequestProtocol>(for request: T, result: ((Result<T.ResponseType, Error>) -> Void)?) {
        let request = createRequestForAlamofire(request)
        request.validate()
        request.responseDecodable(of: T.ResponseType.self) { (response) in
            switch response.result {
            case .success(let value):
                result?(.success(value))
            case .failure(let error):
                result?(.failure(error))
            }
        }
    }
}
