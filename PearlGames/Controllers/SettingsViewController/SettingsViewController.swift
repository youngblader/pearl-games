//
//  SettingsViewController.swift
//  PearlGames
//
//  Created by Евгений Зорич on 7.10.23.
//

import UIKit

final class SettingsViewController: UIViewController {
    private let settingsProvider: SettingsProvider
    
    // LoadView
    private var settingsView: SettingsView {
        return self.view as! SettingsView
    }
    
    override func loadView() {
        self.view = SettingsView(frame: UIScreen.main.bounds)
    }
    
    init(provider: SettingsProvider) {
        self.settingsProvider = provider
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        settingsView.update()
        
        settingsView.onButtonTapped = { type in
            self.onSettingsOptionTapped(type)
        }
    }
    
    private func onSettingsOptionTapped(_ type: SettingOptionType) {
        switch type {
        case .appearance:
            settingsProvider.router.navigateToAppearanceController(self)
        case .theme:
            return
        }
    }
}

extension SettingsViewController {
    private func setup() {
        self.title = "Settings"
        
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
