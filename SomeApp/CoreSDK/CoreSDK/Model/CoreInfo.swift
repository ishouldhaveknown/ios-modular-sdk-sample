//
//  CoreInfo.swift
//  CoreSDK
//
//  Created by Be on 07.07.23.
//

import Foundation

public struct CoreInfo: Codable {
    enum CodingKeys: String, CodingKey {
        case apiVersion = "api_version"
        case basePath = "base_path"
    }
    
    public var apiVersion: String
    public var basePath: String
    
    public init(apiVersion: String, basePath: String) {
        self.apiVersion = apiVersion
        self.basePath = basePath
    }
}
