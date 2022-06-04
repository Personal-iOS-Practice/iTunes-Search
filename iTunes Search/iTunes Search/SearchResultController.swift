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
    let baseURLString = "https://itunes.apple.com/search?"
    // Search results array
    var searchResults: [SearchResult] = []
    
//MARK: - Methods
    // Perform search method
    func performSearch(searchTerm: String, resultType: ResultType, completion: @escaping (Error?) -> Void) {
        // Constructing the search URL
        var searchURL: URL {
            var urlComponents = URLComponents(string: baseURLString)!
            urlComponents.queryItems?.append(URLQueryItem(name: "limit", value: "25"))
            urlComponents.queryItems?.append(URLQueryItem(name: "media", value: resultType.rawValue))
            urlComponents.queryItems?.append(URLQueryItem(name: "term", value: searchTerm))
            return urlComponents.url!
        }
        
        // Starting the URL Session data task
        URLSession.shared.dataTask(with: searchURL) { data, _, error in
            if let error = error {
                print("ERROR: Search failed! error message: \(error)")
                completion(error)
                return
            }
            guard let data = data else {
                print("ERROR: Data not found!")
                completion(NSError())
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let searchResults = try decoder.decode(SearchResults.self, from: data)
                self.searchResults = searchResults.results
                completion(nil)
            } catch {
                print("ERROR: Could not decode received data! Error message: \(error)")
                completion(error)
            }
        }.resume()
    }
    
}
