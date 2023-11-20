//
//  AppearanceView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.10.23.
//

import UIKit
import SnapKit

final class AppearanceView: UIView {
    private let appIconsTitleLabel = TextLabel(label: "APP ICON", size: 12, color: .textGray, typeLabel: .regular)
    private let appIconsCollectionView = AppIconsCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppearanceView {
    private func setupViews() {
        self.backgroundColor = .black
        
        self.addSubview(appIconsTitleLabel)
        self.addSubview(appIconsCollectionView)
    }
    
    private func setupConstraints() {
        appIconsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).inset(20)
            make.left.right.equalTo(self).inset(26)
        }
        
        appIconsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(appIconsTitleLabel.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(16)
        }
    }
}
