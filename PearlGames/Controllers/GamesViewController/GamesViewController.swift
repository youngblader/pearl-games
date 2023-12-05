//
//  GamesViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 17.10.23.
//

import UIKit

final class GamesViewController: UIViewController {
    private let gamesProvider: GamesProvider
    
    // LoadView
    private var gamesView: GamesView {
        return self.view as! GamesView
    }
    
    override func loadView() {
        self.view = GamesView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchGames()
        
        gamesView.gamePreviewTableView.onGamePreviewCellTapped = { id in
            self.presentGameDetailsController(id)
        }
        
        gamesView.gamePreviewTableView.onGameCategoryTapped = { category in
            self.presentGamesCategoryController(category)
        }
    }
    
    init(provider: GamesProvider) {
        self.gamesProvider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchGames() {
        Task {
            gamesView.state = .loading
            do {
                async let comingGames = gamesProvider.gameService.fetchCoomingGames(page: 1, size: 5)
                async let newReleasedGames = gamesProvider.gameService.fetchNewReleasedGames(page: 1, size: 5)
                async let popularGames = gamesProvider.gameService.fetchPopularGames(page: 1, size: 5)
                
                let data = try await GamesPreviewData(comingSoon: comingGames, newReleased: newReleasedGames, popularGames: popularGames)
                
                gamesView.update(data)
            } catch {
                print("ERROR", error)
                gamesView.state = .error(.failed)
            }
        }
    }
    
    private func presentGameDetailsController(_ gameId: Int) {
        gamesProvider.router.navigateToGameDetailsController(gameId, self)
    }
    
    private func presentGamesCategoryController(_ category: GameCategory) {
        gamesProvider.router.navigateToGamesCategoryController(category, self)
    }
}

extension GamesViewController {
    private func setup() {
        self.navigationItem.largeTitleDisplayMode = .never
    }
}
