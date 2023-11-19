//
//  AppIconCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.10.23.
//

import UIKit
import SnapKit

final class AppIconCell: UICollectionViewCell {
    static var reuseId = "AppIconCell"
    
    private let appIconNameLabel = TextLabel(size: 12, typeLabel: .regular, aligment: .center, linesNumber: 1)
    
    private let appIconImageView: UIImageView = {
        let imageView = UIImageView()
            
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ appIcon: AppIcon) {
        appIconNameLabel.text = appIcon.title
        appIconImageView.image = UIImage(named: appIcon.imageName)
    }
}

extension AppIconCell {
    private func setupViews() {
        contentView.addSubview(appIconImageView)
        contentView.addSubview(appIconNameLabel)
    }
    
    private func setpConstraints() {
        appIconImageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
        }
        
        appIconNameLabel.snp.makeConstraints { make in
            make.top.equalTo(appIconImageView.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}
