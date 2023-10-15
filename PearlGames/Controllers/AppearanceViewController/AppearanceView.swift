//
//  AppearanceView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.10.23.
//

import UIKit
import SnapKit

final class AppearanceView: UIView {
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
        self.addSubview(appIconsCollectionView)
    }
    
    private func setupConstraints() {
        appIconsCollectionView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
        }
    }
}
