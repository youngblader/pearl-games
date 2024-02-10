//
//  GamesDetailsMetaView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.11.23.
//

import UIKit
import SnapKit

final class GamesDetailsMetaView: UIStackView {
    private let titleLabel = TextLabel(size: 14, color: .gray, fontLabel: .semiBold)
    
    private let subTitleLabel = TextLabel(size: 14, color: .white, fontLabel: .regular)
    
    init(frame: CGRect = .zero, title: String) {
        self.titleLabel.text = title
        super.init(frame: frame)
        
        setupStyleSubviews()
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ subtitle: String) {
        if subtitle.isEmpty {
            self.isHidden = true
            return
        }
        
        subTitleLabel.text = subtitle
    }
}

extension GamesDetailsMetaView {
    private func setupStyleSubviews() {
        self.distribution = .equalSpacing
        self.axis = .vertical
        self.spacing = 8
    }
    
    private func setupViews() {
        self.addArrangedSubview(titleLabel)
        self.addArrangedSubview(subTitleLabel)
    }
}
