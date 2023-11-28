//
//  RatingDistributionCell.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.11.23.
//

import UIKit
import SnapKit

final class RatingDistributionCell: UICollectionViewCell {
    static var reuseId = "RatingDistributionCell"
    
    private let ratingTitle = TextLabel(size: 14, color: .white, typeLabel: .semiBold, linesNumber: 1)
    private let ratingNumber = TextLabel(size: 12, color: .textGray, typeLabel: .regular)
    
    private let ratingContentView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyleCell()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ rating: DetailGameRating) {
        ratingTitle.text = rating.title.capitalized
        ratingNumber.text = "\(rating.count)"
    }
}

extension RatingDistributionCell {
    private func setupStyleCell() {
        contentView.layer.cornerRadius = 14
        contentView.layer.borderWidth = 1
        contentView.backgroundColor = .lightBlack
        contentView.layer.borderColor = UIColor.borderButtonColor.withAlphaComponent(0.2).cgColor
    }
    
    private func setupViews() {
        contentView.addSubview(ratingTitle)
        contentView.addSubview(ratingNumber)
    }
    
    private func setupConstraints() {
        ratingTitle.snp.makeConstraints { make in
            make.top.bottom.equalTo(contentView).inset(5)
            make.left.equalTo(contentView).inset(16)
        }
        
        ratingNumber.snp.makeConstraints { make in
            make.left.equalTo(ratingTitle.snp.right).offset(10)
            make.top.bottom.equalTo(contentView).inset(5)
            make.right.equalTo(contentView).inset(16)
        }
    }
}
