//
//  SearchResult.swift
//  iTunes Search
//
//  Created by Waseem Idelbi on 6/3/22.
//

import Foundation

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
