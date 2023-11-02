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
        
        fetchGames()
        
        gamesView.gamePreviewTableView.onTappedGameCell = { id in
            self.presentGameDetailsController(id)
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
                
                let data = try await GamesPreviewData(new: [], comingSoon: comingGames, newReleased: newReleasedGames, popularGames: popularGames)
                
                gamesView.update(data)
            } catch {
                gamesView.state = .error(.failed)
                print(error)
            }
        }
    }
    
    private func presentGameDetailsController(_ gameId: Int) {
        gamesProvider.router.navigateToGameDetailsController(gameId, self)
    }
}
