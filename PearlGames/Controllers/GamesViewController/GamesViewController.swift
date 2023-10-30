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
        
        gamesView.gamePreviewTableView.onTappedGameCell = {
            self.presentGameDetailsController()
        }
    }
    
    init(provider: GamesProvider) {
        self.gamesProvider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func presentGameDetailsController() {
        gamesProvider.router.navigateToGameDetailsController(self)
    }
}

extension GamesViewController {
    
}
