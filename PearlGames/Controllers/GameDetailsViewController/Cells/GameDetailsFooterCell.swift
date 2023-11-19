//
//  GameDetailsFooterCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 18.11.23.
//

import UIKit
import SnapKit

final class GameDetailsFooterCell: UITableViewCell {
    static var reuseId = "GameDetailsFooterCell"
    
    var websiteUrl: String? // make property
    var onUrlButtonTapped: ((String)->())?
    
    private let storesCollectionView = StoresCollectionView()
    
    private let titleLabel = TextLabel(label: "Where to buy", size: 14, color: .gray, typeLabel: .semiBold)
    private let websiteLabel = TextLabel(label: "Website", size: 14, color: .gray, typeLabel: .semiBold)
    
    private let websiteButton: UIButton = {
        let button = UIButton()
        
        button.titleLabel?.font = UIFont(name: "Poppins-SemiBold", size: 14)
        button.titleLabel?.textAlignment = .left
        
        button.backgroundColor = .red
        
        button.addTarget(self, action: #selector(onWebsiteButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
//    private let headerStackView: UIStackView = {
//        let stack = UIStackView()
//
//        stack.axis = .vertical
//        stack.distribution = .equalSpacing
//        stack.spacing = 10
////        stack.alignment = .leading
//
//        return stack
//    }()
    
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
        self.websiteUrl = game.website
        storesCollectionView.update(game.stores)
        websiteButton.setTitle(game.website, for: .normal)
    }
    
    //MARK: Actions
    @objc private func onWebsiteButtonTapped() {
        if let url = websiteUrl {
            self.onUrlButtonTapped?(url)
        }
    }
}

extension GameDetailsFooterCell {
    private func setupViews() {
        contentView.backgroundColor = .green
        
//        contentView.addSubview(headerStackView)
//
//        headerStackView.addArrangedSubview(titleLabel)
//        headerStackView.addArrangedSubview(storesCollectionView)
//        headerStackView.addArrangedSubview(websiteLabel)
//        headerStackView.addArrangedSubview(websiteButton)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(storesCollectionView)
        contentView.addSubview(websiteLabel)
        contentView.addSubview(websiteButton)
    }
    
    private func setupConstraints() {
//        headerStackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
        titleLabel.snp.makeConstraints { make in
            make.top.left.right.equalTo(contentView)
        }

        storesCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalTo(contentView)
        }
        
        websiteLabel.snp.makeConstraints { make in
            make.top.equalTo(storesCollectionView.snp.bottom).inset(16)
            make.left.right.equalTo(contentView)
        }
        
        websiteButton.snp.makeConstraints { make in
            make.top.equalTo(websiteLabel.snp.bottom).inset(16)
            make.left.right.bottom.equalTo(contentView)
        }
    }
}
