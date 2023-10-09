//
//  AppearanceViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit

final class AppearanceViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AppearanceViewController {
    private func setup() {
        self.title = "Appearance"
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
