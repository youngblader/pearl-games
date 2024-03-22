//
//  GameDetailsViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 28.10.23.
//

import UIKit

final class GameDetailsViewController: UIViewController {
    private let gameDetailsProvider: GameDetailsProvider
    
    private var gameId: Int
    private var gameInWishlist: Bool = false
    
    // LoadView
    private var gameDetailsView: GameDetailsView {
        return self.view as! GameDetailsView
    }
    
    override func loadView() {
        self.view = GameDetailsView(frame: UIScreen.main.bounds)
    }
    
    init(gameId: Int, provider: GameDetailsProvider) {
        self.gameDetailsProvider = provider
        self.gameId = gameId
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchGameById(gameId)
        checkGameInWishlist(gameId)
        
        gameDetailsView.onWebsiteUrlTapped = { url in
            self.presentWebViewController(url)
        }
        
        gameDetailsView.onSaveGameTapped = { game in
            self.saveGameInWishlist(game)
        }
    }
    
    private func fetchGameById(_ gameId: Int) {
        Task {
            gameDetailsView.state = .loading
            do {
                let game = try await gameDetailsProvider.gameService.fetchGame(id: gameId)
                
                gameDetailsView.update(game, gameInWishlist)
            } catch {
                gameDetailsView.state = .error(.failed)
                print("ERROR", error)
            }
        }
    }
    
    private func saveGameInWishlist(_ game: GameDetails) {
        var wishlistGames = gameDetailsProvider.wishlistArchiver.retrieve()
        
        let gameInWishlist = wishlistGames.contains { $0.id == game.id }
        
        if gameInWishlist {
            wishlistGames = wishlistGames.filter { $0.id != game.id }
        } else {
            wishlistGames.append(game)
        }
        
        gameDetailsProvider.wishlistArchiver.save(wishlistGames)
    }
    
    private func checkGameInWishlist(_ gameId: Int) {
        let wishlistGames = gameDetailsProvider.wishlistArchiver.retrieve()
        
        gameInWishlist = wishlistGames.contains { $0.id == gameId }
    }
    
    private func presentWebViewController(_ url: String) {
        gameDetailsProvider.router.navigateToWebViewController(url, self)
    }
}
