//
//  SearchController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit

final class SearchController: UISearchController {
    private var searchTimer = Timer()
    var onSearchGames: ((String)->())?
    
    var searchText: String = "" {
        didSet {
            searchTimer.invalidate()
            
            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { _ in
                self.onSearchGames?(self.searchText)
            }
            
//            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
//                self.onSearchGames?(self.searchText)
//            })
        }
    }
    
    override init(searchResultsController: UIViewController?) {
        super.init(searchResultsController: nil)
        
        self.delegate = self
        self.searchResultsUpdater = self
        
        self.obscuresBackgroundDuringPresentation = false
        self.hidesNavigationBarDuringPresentation = false
        
        self.searchBar.placeholder = "Search"
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
        guard let text = searchController.searchBar.text else {
            return
        }
        
        self.searchText = text
    }
}
