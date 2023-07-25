//
//  MockAPIClient.swift
//  CoreSDKTests
//
//  Created by Be on 07.07.23.
//

import CoreSDK
import API

class MockAPIClient: APIClientProtocol {
    
    private let hasInternet: Bool
    
    init(hasInternet: Bool) {
        self.hasInternet = hasInternet
    }
    
    func makeRequest<T: Codable>(request: URLRequest, completion: @escaping (Result<T, APIError>) -> Void)  {
        if T.self == CoreInfo.self {
            if hasInternet {
                completion(.success(
                    CoreInfo(apiVersion: "1.0.0", basePath: "https://test.com") as! T
                ))
            } else {
                completion(.failure(.noInternet))
            }
        } else {
            completion(.failure(.parsing))
        }
    }
}
