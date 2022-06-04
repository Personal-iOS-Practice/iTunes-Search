//
//  SearchResult.swift
//  iTunes Search
//
//  Created by Waseem Idelbi on 6/3/22.
//

import Foundation

/// Individual search result model
struct SearchResult: Codable {
//MARK: - Properties
    let title: String
    let creator: String
    
//MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case creator = "artistName"
    }
    
}


/// Model used to decode JSON data into
struct SearchResults: Codable {
//MARK: - Properties
    let results: [SearchResult]
}
