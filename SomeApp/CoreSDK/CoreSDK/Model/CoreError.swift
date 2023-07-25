//
//  CoreError.swift
//  CoreSDK
//
//  Created by Be on 07.07.23.
//

import Foundation
import API

public enum CoreError: Error {
    case wrongSelf
    case badRequest
    case apiError(error: APIError)
}
