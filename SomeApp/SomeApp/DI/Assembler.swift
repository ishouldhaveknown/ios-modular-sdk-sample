//
//  Assembler.swift
//  SomeApp
//
//  Created by Be on 07.07.23.
//

import CoreSDK

struct Assembler {
    
    static let `default` = Assembler()
    
    var coreSDK: CoreSDKProtocol = CoreSDK()
    
    var infoView: InfoView {
        InfoView(viewModel: InfoViewModel(coreSDK: coreSDK))
    }
}
