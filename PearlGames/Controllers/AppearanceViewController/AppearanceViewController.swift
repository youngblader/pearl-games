//
//  AppearanceViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit

final class AppearanceViewController: UIViewController {
    // LoadView
    private var appearanceView: AppearanceView {
        return self.view as! AppearanceView
    }
    
    override func loadView() {
        self.view = AppearanceView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension AppearanceViewController {
    private func setup() {
        self.title = "Appearance"
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
}
