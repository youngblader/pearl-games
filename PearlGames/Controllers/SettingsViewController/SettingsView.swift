//
//  SettingsView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit
import SnapKit

final class SettingsView: UIView {
    private let settingsTableView = SettingsTableView()
    
    var onButtonTapped: (()->())?
    
    private let settingsVersionsLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var appearanceButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("NavigateToAppearance", for: .normal)
        button.addTarget(self, action: #selector(navigateToAppearanceVC), for: .touchUpInside)
        
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update() {
        let buildVersion = Bundle.main.buildVersionNumber ?? "1"
        let releaseVersion = Bundle.main.releaseVersionNumber ?? "1.0.0"
        
        settingsVersionsLabel.text = "Pearl Games Mobile Version \(releaseVersion) (\(buildVersion))"
    }
    
    @objc private func navigateToAppearanceVC() {
        onButtonTapped?()
    }
}

extension SettingsView {
    private func setupViews() {
        self.addSubview(settingsTableView)
        self.addSubview(settingsVersionsLabel)
    }
    
    private func setupConstraints() {
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.left.right.equalTo(self)
            make.bottom.equalTo(settingsVersionsLabel.snp.top).offset(10)
        }

        settingsVersionsLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
}
