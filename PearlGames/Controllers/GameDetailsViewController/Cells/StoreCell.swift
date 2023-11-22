//
//  StoreCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 14.11.23.
//

import UIKit
import SnapKit

final class StoreCell: UICollectionViewCell {
    static var reuseId = "StoreCell"
    
    private let storeLabel = TextLabel(size: 14, color: .white, typeLabel: .semiBold, linesNumber: 1)

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ store: DetailsGameStore) {
        storeLabel.text = store.name
    }
}

extension StoreCell {
    private func setupViews() {
        contentView.backgroundColor = .lightBlack
        contentView.layer.cornerRadius = 16
        
        contentView.addSubview(storeLabel)
    }
    
    private func setupConstraints() {
        storeLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(8)
            make.left.right.equalTo(contentView).inset(12)
        }
    }
}
