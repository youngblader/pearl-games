//
//  SearchGamesViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class SearchGamesViewController: UIViewController {
    // LoadView
    private var searchGameView: SearchGameView {
        return self.view as! SearchGameView
    }
    
    override func loadView() {
        self.view = SearchGameView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        searchGameView.searchGamesController.update("Games..")
    }
}

extension SearchGamesViewController {
    private func setup() {
        self.title = "Explore"
        
        self.navigationController?.navigationItem.searchController = searchGameView.searchGamesController
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
