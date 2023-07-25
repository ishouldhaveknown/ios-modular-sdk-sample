//
//  CoreSDK.swift
//  CoreSDK
//
//  Created by Be on 07.07.23.
//

import Combine
import API

public protocol CoreSDKProtocol {
    
    func fetchCoreInfo() -> AnyPublisher<CoreInfo, CoreError>
}

public class CoreSDK: CoreSDKProtocol {

    private let apiClient: APIClientProtocol = APIClient()
    private lazy var coreRepository: CoreRepositoryProtocol = {
        CoreRepository(apiClient: apiClient)
    }()

    public init() {}
    
    public func fetchCoreInfo() -> AnyPublisher<CoreInfo, CoreError> {
        coreRepository.fetchCoreInfo()
    }
}
