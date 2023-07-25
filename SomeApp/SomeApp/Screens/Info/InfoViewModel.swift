//
//  InfoViewModel.swift
//  SomeApp
//
//  Created by Be on 07.07.23.
//

import Combine
import CoreSDK

class InfoViewModel: ObservableObject {
    
    @Published var info: CoreInfo?
    @Published var fetching: Bool = false
    @Published var error: AppError?
    
    private let coreSDK: CoreSDKProtocol
    private var cancellables: Set<AnyCancellable> = []

    init(coreSDK: CoreSDKProtocol) {
        self.coreSDK = coreSDK
    }
    
    func onAppear() {
        fetching = true
        coreSDK.fetchCoreInfo()
            .sink { [weak self] result in
                if case .failure(let error) = result {
                    self?.error = .coreError(error: error)
                }
                self?.fetching = false
            } receiveValue: { info in
                self.info = info
            }
            .store(in: &cancellables)
    }
}
