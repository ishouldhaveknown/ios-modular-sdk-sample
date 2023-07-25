//
//  CoreRepository.swift
//  CoreSDK
//
//  Created by Be on 07.07.23.
//

import Combine
import API

public protocol CoreRepositoryProtocol {
    
    func fetchCoreInfo() -> AnyPublisher<CoreInfo, CoreError>
}

public class CoreRepository: CoreRepositoryProtocol {

    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func fetchCoreInfo() -> AnyPublisher<CoreInfo, CoreError> {
        Deferred {
            Future<CoreInfo, CoreError> { [weak self] promise in
                guard let self = self else {
                    promise(.failure(.wrongSelf))
                    return
                }
                guard let url = URL(string: "https://test.com/coreinfo") else {
                    promise(.failure(.badRequest))
                    return
                }
                apiClient.makeRequest(request: URLRequest(url: url)) { (result: Result<CoreInfo, APIError>) in
                    switch result {
                    case .success(let response):
                        promise(.success(response))
                    case .failure(let error):
                        promise(.failure(.apiError(error: error)))
                    }
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
