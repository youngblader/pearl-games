//
//  SettingsOptionCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 17.10.23.
//

import UIKit
import SnapKit
import SettingsIconGenerator

final class SettingCell: UITableViewCell {
    static var reuseId = "SettingCell"
    
    private let iconImageView = UIImageView()
    private let settingsLabel = TextLabel(size: 14, fontLabel: .medium, linesNumber: 1)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessoryType = .disclosureIndicator
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ option: SettingsOption) {
        settingsLabel.text = option.title
        iconImageView.image = UIImage.generateSettingsIcon(option.icon, backgroundColor: option.iconBackgroundColor)
    }
}

extension SettingCell {
    private func setupViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(settingsLabel)
    }
    
    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(10)
            make.top.bottom.equalTo(contentView).inset(5)
        }
        
        settingsLabel.snp.makeConstraints { make in
            make.left.equalTo(iconImageView.snp.right).offset(10)
            make.centerY.equalTo(contentView)
        }
    }
}
