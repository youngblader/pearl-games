//
//  SettingsView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit
import SnapKit

final class SettingsView: UIView {
    var onSettingsCellTapped: ((SettingOptionType)->())?
    
    private let settingsTableView = SettingsTableView()
    private let versionLabel = TextLabel(size: 12, color: .lightGray, fontLabel: .regular, aligment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        settingsTableView.onSettingsCellTapped = { type in
            self.onSettingsCellTapped?(type)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update() {
        let buildVersion = Bundle.main.buildVersionNumber ?? "1"
        let releaseVersion = Bundle.main.releaseVersionNumber ?? "1.0.0"
        
        versionLabel.text = "PearlGames Mobile Version \(releaseVersion) (\(buildVersion))"
    }
}

extension SettingsView {
    private func setupViews() {
        self.addSubview(settingsTableView)
        self.addSubview(versionLabel)
    }
    
    private func setupConstraints() {
        settingsTableView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.left.right.equalTo(self)
            make.bottom.equalTo(versionLabel.snp.top).offset(10)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
}
