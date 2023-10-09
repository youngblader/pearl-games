//
//  SearchGamesViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class SearchGamesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension SearchGamesViewController {
    private func setup() {
        self.title = "Explore"
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
