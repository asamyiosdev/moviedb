//
//  ApiClientContract.swift
//  moviedb
//
//  Created by Ahmed samy on 19/07/2024.
//

import Foundation

protocol ApiClientContract {
    func call(method: HTTPMethod,
              parameters: [String: Any]?,
              webserviceType: String,
              success: @escaping ([String: Any]) -> Void, failed: @escaping ([String: Any]) -> Void)
    
}

