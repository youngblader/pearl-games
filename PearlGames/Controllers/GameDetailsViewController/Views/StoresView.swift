//
//  StoresView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 14.11.23.
//

import UIKit
import SnapKit

final class StoresView: UIStackView {
    private let titleLabel = TextLabel(label: "Where to buy", size: 14, color: .gray, typeLabel: .semiBold)
    private let storesCollectionView = StoresCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ stores: [DetailGameStores]) {
        storesCollectionView.update(stores)
    }
}

extension StoresView {
    private func setupViews() {
        self.distribution = .equalSpacing
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .fill
        
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(storesCollectionView)
        
        self.backgroundColor = .green
    }
    
    private func setupConstraints() {
//        titleLabel.snp.makeConstraints { make in
//            make.top.left.right.equalTo(self)
//        }
//
//        storesCollectionView.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(10)
//            make.left.right.bottom.equalTo(self)
//        }
    }
}
