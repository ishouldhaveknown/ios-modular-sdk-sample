//
//  AppError.swift
//  SomeApp
//
//  Created by Be on 07.07.23.
//

import Foundation
import CoreSDK

enum AppError: Error {
    case wrongSelf
    case generic
    case coreError(error: CoreError)
}
