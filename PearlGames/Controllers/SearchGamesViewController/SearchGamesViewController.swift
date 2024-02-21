//
//  SearchGamesViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class SearchGamesViewController: UIViewController {
    private let searchGamesProvider: SearchGamesProvider
    
    private var previewSearchGames: [Game] = []
    private var searchGames: [Game] = []
    
    // searchController properties
    private var searchBarIsEmpty: Bool {
        guard let text = searchGameView.searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return searchGameView.searchController.isActive && !searchBarIsEmpty
    }
    
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
        fetchPreviewSearchGames()
        
        searchGameView.searchController.onSearchGames = { text in
            self.fetchSearchGames(text)
        }
        
        searchGameView.searchGamesTableView.onGameCellTapped = { id in
            self.presentGameDetailsController(id)
        }
    }
    
    init(provider: SearchGamesProvider) {
        self.searchGamesProvider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchPreviewSearchGames() {
        Task {
            searchGameView.state = .loading
            do {
                let games = try await searchGamesProvider.gameService.fetchPopularGames(page: 1, size: 20)
                
                self.previewSearchGames = games
                searchGameView.update(games, searchGames, isFiltering)
            } catch {
                print("ERROR", error)
                searchGameView.state = .error(.failed)
            }
        }
    }
    
    private func fetchSearchGames(_ searchText: String) {
        Task {
            searchGameView.state = .loading
            do {
                let games = try await searchGamesProvider.gameService.fetchSearchGames(searchText: searchText)
                
                self.searchGames = games
                searchGameView.update(previewSearchGames, games, isFiltering)
            } catch {
                print("ERROR", error)
                searchGameView.state = .error(.failed)
            }
        }
    }
    
    private func presentGameDetailsController(_ gameId: Int) {
        searchGamesProvider.router.navigateToGameDetailsController(gameId, self)
    }
}

extension SearchGamesViewController {
    private func setup() {
        self.title = "Explore"
        
        self.navigationItem.searchController = searchGameView.searchController
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
