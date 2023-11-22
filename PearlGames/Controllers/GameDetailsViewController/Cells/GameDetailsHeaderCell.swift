//
//  GameDetailsHeaderCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 3.11.23.
//

import UIKit
import SnapKit

final class GameDetailsHeaderCell: UITableViewCell {
    static var reuseId = "GameDetailsHeaderCell"
    
    var onSaveGameTapped: (()->())?
    
    private var gameInWishlist: Bool = false {
        didSet {
            let image = self.gameInWishlist ? "bookmark.fill" : "bookmark"
            favouriteButton.setImage(UIImage(systemName: image), for: .normal)
        }
    }
    
    private let ratingDistributionCollectionView =  RatingDistributionCollectionView()
    
    private let gameNameLabel = TextLabel(size: 16, color: .white, typeLabel: .semiBold, linesNumber: 2)
    
    private let averagePlayTimeLabel = TextLabel(size: 12, color: .white, typeLabel: .regular)
    
    private let headerStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 12
        stack.alignment = .top
        
        return stack
    }()
    
    private lazy var favouriteButton: UIButton = {
        let button = UIButton()
        
        button.tintColor = .white
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        
        button.addTarget(self, action: #selector(onSaveWishlistButton(sender:)), for: .touchUpInside)
        
        return button
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
    func update(_ game: GameDetails, _ gameInWishlist: Bool) {
        self.gameInWishlist = gameInWishlist
        
        gameNameLabel.text = game.name
        ratingDistributionCollectionView.update(game.ratings)
        
        if game.playtime == 0 {
            averagePlayTimeLabel.isHidden = true
        } else {
            averagePlayTimeLabel.text = "AVERAGE PLAYTIME: \(game.playtime) HOURS"
        }
    }
    
    //MARK: Actions
    @objc private func onSaveWishlistButton(sender: UIButton) {
        sender.showAnimation {
            self.gameInWishlist.toggle()
            self.onSaveGameTapped?()
        }
    }
}

extension GameDetailsHeaderCell {
    private func setupViews() {
        contentView.addSubview(averagePlayTimeLabel)
        contentView.addSubview(headerStackView)
        
        headerStackView.addArrangedSubview(gameNameLabel)
        headerStackView.addArrangedSubview(favouriteButton)
        
        contentView.addSubview(ratingDistributionCollectionView)
    }
    
    private func setupConstraints() {
        averagePlayTimeLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView).inset(16)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.equalTo(averagePlayTimeLabel.snp.bottom).offset(10)
        }
        
        ratingDistributionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}
