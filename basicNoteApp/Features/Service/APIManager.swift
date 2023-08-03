//
//  APIManager.swift
//  basicNoteApp
//
//  Created by Kaan Kalaycıoğlu on 17.07.2023.
//

import Foundation
import Alamofire
import KeychainSwift

class APIManager {
    static let shareInstance = APIManager()
    private let keyChain = KeychainSwift()
    
    func callRegisterAPI(userRegister:RegisterModel, completionHandler: @escaping (Bool) -> ()) {
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request(register_url, method: .post, parameters: userRegister, encoder: JSONParameterEncoder.default, headers:headers).response { response in
            debugPrint(response)
            switch response.result {
            case.success(let data):
                if let data = data, let registerResponse = try? JSONDecoder().decode(RegisterResponse.self, from: data) {
                    if response.response?.statusCode == 200 {
                        self.keyChain.set(registerResponse.data.access_token, forKey: "access_token")
                        print(registerResponse.data.token_type)
                        print(registerResponse.data.access_token)
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }
                }else {
                    completionHandler(false)
                }
            case.failure(let error):
                completionHandler(false)
                print("myLocalizedError : \(error.localizedDescription)")
                
            }
        }
    }
    
    
    
    // Login session
    
    
    
    func callLoginAPI(userLogin:LoginModel, completionHandler: @escaping (Bool) -> ()) {
        let headers: HTTPHeaders = [.contentType("application/json")]
        AF.request(login_url, method: .post, parameters: userLogin, encoder: JSONParameterEncoder.default, headers:headers).response { response in
            debugPrint(response)
            switch response.result {
            case.success(let data):
                if let data = data, let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
                    if response.response?.statusCode == 200 {
                        self.keyChain.set(loginResponse.data.access_token, forKey: "access_token")
                        print(loginResponse.data.token_type)
                        print(loginResponse.data.access_token)
                        completionHandler(true)
                    } else {
                        completionHandler(false)
                    }
                }else {
                    completionHandler(false)
                }
            case.failure(let error):
                completionHandler(false)
                print("myLocalizedError : \(error.localizedDescription)")
                
            }
        }
    }
    
    
    
            }
        
        
      
    

