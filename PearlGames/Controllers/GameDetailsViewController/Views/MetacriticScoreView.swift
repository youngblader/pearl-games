//
//  MetaScoreView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import SnapKit

final class MetacriticScoreView: UIView {
    private var metaScoreLabel = TextLabel(size: 14, typeLabel: .medium, aligment: .center)
    
    private var numberOfMetacritic: Int = 0 {
        didSet {
            let scoreColor: UIColor = numberOfMetacritic >= 65 ? .green : .yellow
            
            metaScoreLabel.text = String(numberOfMetacritic)
            
            metaScoreLabel.textColor = scoreColor
            containerView.layer.borderColor = scoreColor.cgColor
        }
    }
    
    private let containerView: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
        
        return view
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
    func update(_ value: Int) {
        self.numberOfMetacritic = value
    }
}

extension MetacriticScoreView {
    private func setupViews() {
        self.addSubview(containerView)
        containerView.addSubview(metaScoreLabel)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        metaScoreLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(containerView).inset(2)
            make.left.right.equalTo(containerView).inset(8)
        }
    }
}
