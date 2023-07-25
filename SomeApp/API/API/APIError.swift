//
//  APIError.swift
//  CoreSDK
//
//  Created by Be on 07.07.23.
//

import Foundation

public enum APIError: Error {
    case emptyResponse
    case parsing
    case noInternet
}
