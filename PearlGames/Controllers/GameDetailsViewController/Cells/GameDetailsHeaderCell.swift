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
            let nameImage = self.gameInWishlist ? "bookmark.fill" : "bookmark"
            favouriteButton.setImage(UIImage(systemName: nameImage), for: .normal)
        }
    }
    
    private let gameNameLabel = TextLabel(size: 16, color: .white, typeLabel: .semiBold, linesNumber: 2)
    
    private let playTimeLabel = TextLabel(size: 12, color: .white, typeLabel: .regular)
    
    private let aboutSubTitleLabel = TextLabel(label: "About", size: 18, color: .white, typeLabel: .semiBold)
    
    private let descriptionLabel = TextLabel(size: 14, color: .white, typeLabel: .regular)
    
    private let ratingDistributionView = RatingDistributionView()
    
    private let headerStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 12
        stack.alignment = .top
        
        return stack
    }()
    
    private let aboutStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.distribution = .equalSpacing
        stack.axis = .vertical
        stack.spacing = 10
        
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 0, right: 16)
        stack.isLayoutMarginsRelativeArrangement = true
        
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
        ratingDistributionView.update(game.ratings)
        descriptionLabel.text = game.descriptionRaw
        
        if game.playtime == 0 {
            playTimeLabel.isHidden = true
        } else {
            playTimeLabel.text = "AVERAGE PLAYTIME: \(game.playtime) HOURS"
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
        contentView.addSubview(playTimeLabel)
        contentView.addSubview(headerStackView)
        
        headerStackView.addArrangedSubview(gameNameLabel)
        headerStackView.addArrangedSubview(favouriteButton)
        
        contentView.addSubview(ratingDistributionView)
        contentView.addSubview(aboutStackView)
        
        aboutStackView.addArrangedSubview(aboutSubTitleLabel)
        aboutStackView.addArrangedSubview(descriptionLabel)
    }
    
    private func setupConstraints() {
        playTimeLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView).inset(16)
        }
        
        headerStackView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.equalTo(playTimeLabel.snp.bottom).offset(10)
        }
        
        ratingDistributionView.snp.makeConstraints { make in
            make.top.equalTo(gameNameLabel.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
        
        aboutStackView.snp.makeConstraints { make in
            make.top.equalTo(ratingDistributionView.snp.bottom)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}
