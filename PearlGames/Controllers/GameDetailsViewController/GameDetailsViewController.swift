//
//  GameDetailsViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 28.10.23.
//

import UIKit

final class GameDetailsViewController: UIViewController {
    
    // LoadView
    private var gameDetailsView: GameDetailsView {
        return self.view as! GameDetailsView
    }
    
    override func loadView() {
        self.view = GameDetailsView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
