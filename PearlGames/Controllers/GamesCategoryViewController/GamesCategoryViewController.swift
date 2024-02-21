//
//  GamesCategoryViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import UIKit

final class GamesCategoryViewController: UIViewController {
    private let gamesCategoryProvider: GamesCategoryProvider
    private let category: GameCategory
    
    // LoadView
    private var gamesCategoryView: GamesCategoryView {
        return self.view as! GamesCategoryView
    }
    
    override func loadView() {
        self.view = GamesCategoryView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        fetchCategoryGames()
        
        gamesCategoryView.gamesCategoryCollectionView.onGameCellTapped = { id in
            self.presentGameDetailsController(id)
        }
    }
    
    init(provider: GamesCategoryProvider, category: GameCategory) {
        self.gamesCategoryProvider = provider
        self.category = category
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func fetchCategoryGames() {
        Task {
            gamesCategoryView.state = .loading
            do {
                let games = try await  gamesCategoryProvider.gameService.fetchCategoryGames(category: category)
                
                gamesCategoryView.update(games)
            } catch {
                gamesCategoryView.state = .error(.failed)
                print("ERROR", error)
            }
        }
    }
    
    private func presentGameDetailsController(_ gameId: Int) {
        gamesCategoryProvider.router.navigateToGameDetailsController(gameId, self)
    }
}

extension GamesCategoryViewController {
    private func setup() {
        self.title = category.title
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
