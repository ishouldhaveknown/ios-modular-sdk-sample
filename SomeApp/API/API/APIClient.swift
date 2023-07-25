//
//  APIClient.swift
//  CoreSDK
//
//  Created by Be on 07.07.23.
//

import Foundation

public protocol APIClientProtocol {
    
    func makeRequest<T: Codable>(request: URLRequest, completion: @escaping (Result<T, APIError>) -> Void)
}

public class APIClient: APIClientProtocol {
    
    // TODO: onty for showcasing, ignores HTTP method and params
    private let mockResponses: [String: String]
    private let decoder = JSONDecoder()

    public init() {
        let coreInfoResponse = """
{
    "api_version": "1.1.0",
    "base_path": "https://test.com"
}
"""
        mockResponses = ["https://test.com/coreinfo": coreInfoResponse]
    }
    
    public func makeRequest<T: Codable>(request: URLRequest, completion: @escaping (Result<T, APIError>) -> Void) {
        guard
            let urlString = request.url?.absoluteString,
            let response = mockResponses[urlString]
        else {
            completion(.failure(.emptyResponse))
            return
        }
        guard
            let responseData = response.data(using: .utf8),
            let result = try? decoder.decode(T.self, from: responseData)
        else {
            completion(.failure(.parsing))
            return
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion(.success(result))
        }
    }
}
