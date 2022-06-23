//
//  MovieVideoResponse.swift
//  GSNetwork
//
//  Created by Agus cahyono on 21/06/22.
//

import Foundation

// MARK: - MovieVideoResponse
public struct MovieVideoResponse: Codable, Hashable {
    public var results: [VideoResult]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
}

// MARK: - Result
public  struct VideoResult: Codable, Hashable, Identifiable {
    
    public var id: String
    public var name: String
    public var key: String
    public var site: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case key = "key"
        case site = "site"
    }
    
    public var coverImageURL: URL? {
        return URL(string: "http://img.youtube.com/vi/\(key)/0.jpg")
    }
    
    public var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
