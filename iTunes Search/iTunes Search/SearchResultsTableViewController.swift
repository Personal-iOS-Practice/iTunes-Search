//
//  SearchResultsTableViewController.swift
//  iTunes Search
//
//  Created by Waseem Idelbi on 6/4/22.
//

import UIKit

class SearchResultsTableViewController: UITableViewController, UISearchBarDelegate {
    
//MARK: - Properties
    let searchResultsController = SearchResultController()

//MARK: - IBOutlets
    @IBOutlet weak var searchTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
//MARK: - Methods
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
//MARK: TableView Data source and Delegate methods
    // Number of rows in the tableView
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultsController.searchResults.count
    }
    //Configuring each cell in the tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchResult = searchResultsController.searchResults[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        cell.textLabel?.text = searchResult.title
        cell.detailTextLabel?.text = searchResult.creator
        return cell
    }
    
//MARK: UISearchBar Delegate methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var searchType: ResultType {
            switch searchTypeSegmentedControl.selectedSegmentIndex {
            case 0: return ResultType.software
            case 1: return ResultType.music
            case 2: return ResultType.movie
            default: return ResultType.software
            }
        }
        let searchTerm = searchBar.text ?? ""
        searchResultsController.performSearch(searchTerm: searchTerm, resultType: searchType) { error in
            if let error = error {
                print("ERROR: Search Failed! Error message: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

