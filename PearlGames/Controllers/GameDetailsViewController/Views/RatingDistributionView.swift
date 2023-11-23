//
//  RatingDistributionView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 23.11.23.
//

import UIKit
import SnapKit

final class RatingDistributionView: UIView {
    private let titleLabel = TextLabel(label: "Rating Distribution", size: 14, color: .gray, typeLabel: .semiBold)
    
    private let ratingDistributionCollectionView =  RatingDistributionCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ ratings: [DetailGameRating]) {
        if ratings.isEmpty {
            self.isHidden = true
            return
        }
        ratingDistributionCollectionView.update(ratings)
    }
}

extension RatingDistributionView {
    private func setupViews() {
//        self.distribution = .equalSpacing
//        self.axis = .vertical
//        self.spacing = 8
        
        self.addSubview(titleLabel)
        self.addSubview(ratingDistributionCollectionView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self).inset(16)
        }
        
        ratingDistributionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.bottom.equalTo(self)
        }
    }
}
