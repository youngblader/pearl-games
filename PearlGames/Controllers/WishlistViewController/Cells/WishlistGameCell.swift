//
//  WishlistGameCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 16.11.23.
//

import UIKit
import SnapKit

final class WishlistGameCell: UITableViewCell {
    static var reuseId = "WishlistGameCell"
    
    private let gameNameLabel = TextLabel(size: 14, color: .white, fontLabel: .semiBold)
    private let genreGameLabel = TextLabel(size: 12, color: .gray, fontLabel: .medium)
    
    private let containerView =  UIView()
    
    private let gameImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        
        imageView.widthAnchor.constraint(equalToConstant: 85).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 85).isActive = true
        
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ game: GameDetails) {
        gameNameLabel.text = game.name
        gameImageView.sd_setImage(with: URL(string: game.backgroundImage ))
        
        if let genre = game.genres.first?.name {
            genreGameLabel.text = genre
        }
    }
}

extension WishlistGameCell {
    private func setupViews() {
        contentView.addSubview(gameImageView)
        contentView.addSubview(containerView)
        
        containerView.addSubview(gameNameLabel)
        containerView.addSubview(genreGameLabel)
    }
    
    private func setupConstraints() {
        gameImageView.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(16)
            make.centerY.equalTo(contentView)
            make.top.bottom.equalTo(contentView).inset(10)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(16)
            make.left.equalTo(gameImageView.snp.right).offset(10)
        }
        
        gameNameLabel.snp.makeConstraints { make in
            make.left.right.top.equalTo(containerView)
        }
        
        genreGameLabel.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(containerView)
        }
    }
}
