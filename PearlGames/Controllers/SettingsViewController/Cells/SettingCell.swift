//
//  SettingsOptionCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 17.10.23.
//

import UIKit
import SnapKit

final class SettingCell: UITableViewCell {
    static var reuseId = "SettingCell"
    
    private let iconImageContainerView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 4
        
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        accessoryType = .disclosureIndicator
        
        setupViews()
        setupConstraints()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ option: SettingsOption) {
        settingLabel.text = option.title
        iconImageView.image = UIImage(named: option.icon)
        iconImageContainerView.backgroundColor = option.iconBackgroundColor
    }
}

extension SettingCell {
    private func setupViews() {
        contentView.addSubview(iconImageContainerView)
        contentView.addSubview(settingLabel)
        
        iconImageContainerView.addSubview(iconImageView)
    }
    
    private func setupConstraints() {
        iconImageContainerView.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(20)
            make.centerY.equalTo(contentView)
        }
        
        iconImageView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(iconImageContainerView).inset(12)
            make.centerX.centerY.equalTo(iconImageContainerView)
        }
        
        settingLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(iconImageContainerView.snp.right).offset(10)
        }
    }
}
