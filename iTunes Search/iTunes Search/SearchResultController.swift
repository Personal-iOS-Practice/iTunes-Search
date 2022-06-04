//
//  SearchResultController.swift
//  iTunes Search
//
//  Created by Waseem Idelbi on 6/4/22.
//

import Foundation

class SearchResultController {
//MARK: - Properties
    // Base URL
    let baseURL = "https://itunes.apple.com/search?term="
    // Search results array
    var searchResults: [SearchResult] = []
    
//MARK: - Methods
    // Perform search method
    func performSearch(searchTerm: String, resultType: ResultType, completion: (Error?) -> Void) {
        let searchURL = baseURL
    }
    
    
}
