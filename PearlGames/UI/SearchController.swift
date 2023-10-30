//
//  SearchController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit

final class SearchController: UISearchController {
    var onSearchGames: ((String)->())?
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: nil)
    
        self.searchBar.placeholder = "Search"
        
        self.obscuresBackgroundDuringPresentation = false
        self.hidesNavigationBarDuringPresentation = false
        
        self.delegate = self
        self.searchResultsUpdater = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ placeholder: String) {
        self.searchBar.placeholder = placeholder
    }
}

extension SearchController: UISearchControllerDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else {
            return
        }
        
        onSearchGames?(searchText)
    }
}
