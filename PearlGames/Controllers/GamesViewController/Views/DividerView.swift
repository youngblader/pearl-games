//
//  DividerView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit
import SnapKit

final class DividerView: UIView {
    var onGameCategoryTapped: (()->())?
    
    private let titleLabel = TextLabel(size: 18, color: .white, typeLabel: .semiBold)
    
    private lazy var navigateButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        
        button.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        
        button.tintColor = .white
        
        button.backgroundColor = .lightBlack
        button.layer.borderColor = UIColor.borderButtonColor.withAlphaComponent(0.2).cgColor
        
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        
        button.widthAnchor.constraint(equalToConstant: 28).isActive = true
        button.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        button.addTarget(self, action: #selector(gameCategoryTapped(sender:)), for: .touchUpInside)
        
        return button
    }()
    
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
    
    @objc private func gameCategoryTapped(sender: UIButton) {
        sender.showAnimation {
            self.onGameCategoryTapped?()
        }
    }
}

extension DividerView {
    private func setupViews() {
        self.addSubview(titleLabel)
        self.addSubview(navigateButton)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.left.equalTo(self).inset(16)
        }
        
        navigateButton.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
            make.right.equalTo(self)
        }
    }
}
