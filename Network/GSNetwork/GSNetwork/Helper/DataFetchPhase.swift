//
//  DataFetchPhase.swift
//  GSNetwork
//
//  Created by Agus cahyono on 17/06/22.
//

import Foundation

public enum DataFetchPhase<T> {
    case empty
    case success(T)
    case failure(MovieError)
}
