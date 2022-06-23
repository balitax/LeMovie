//
//  FetchTaskToken.swift
//  GSNetwork
//
//  Created by Agus cahyono on 18/06/22.
//

import Foundation

public struct FetchTaskToken: Equatable {
    public var endpoint: MovieListEndpoint
    public var token: Date
    
    public init(endpoint: MovieListEndpoint, token: Date) {
        self.endpoint = endpoint
        self.token = token
    }
}
