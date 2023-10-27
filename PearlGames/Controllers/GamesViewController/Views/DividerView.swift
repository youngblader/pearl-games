//
//  DividerView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit
import SnapKit

final class DividerView: UIView {
    private let titleLabel = TextLabel(size: 20, color: .lightGray, weight: .bold)
    private let navigateLabel = TextLabel(label: "See All", size: 16, color: .lightGray, weight: .medium)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Public update
    func update(_ title: String) {
        titleLabel.text = title
    }
}

extension DividerView {
    private func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(navigateLabel)
        
        self.backgroundColor = .red
        
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).inset(16)
        }
        
        navigateLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.right.equalTo(self).inset(16)
        }
    }
}
