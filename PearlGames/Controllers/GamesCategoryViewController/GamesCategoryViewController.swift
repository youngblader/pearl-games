//
//  GamesCategoryViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 30.10.23.
//

import UIKit

final class GamesCategoryViewController: UIViewController {
    // LoadView
    private var gamesCategoryView: GamesCategoryView {
        return self.view as! GamesCategoryView
    }
    
    override func loadView() {
        self.view = GamesCategoryView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
