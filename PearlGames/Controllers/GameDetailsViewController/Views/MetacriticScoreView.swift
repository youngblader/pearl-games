//
//  MetaScoreView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import SnapKit

final class MetacriticScoreView: UIView {
    private var numberOfMetacritic: Int = 0 {
        didSet {
            let scoreColor: UIColor = numberOfMetacritic >= 65 ? .green : .yellow
            
            metaScoreLabel.text = String(numberOfMetacritic)
            
            metaScoreLabel.textColor = scoreColor
            metaScoreContainer.layer.borderColor = scoreColor.cgColor
        }
    }
    
    private let metascoreTitleLabel = TextLabel(label: "Metascore", size: 14, color: .gray, typeLabel: .semiBold)
    
    private var metaScoreLabel = TextLabel(size: 14, typeLabel: .medium, aligment: .center)
    
    private let metaScoreContainer: UIView = {
        let view = UIView()
        
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
        
        return view
    }()
    
    private let containerStackView: UIStackView = {
        let stack = UIStackView()
        
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 10
        stack.alignment = .leading
        
        return stack
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
        if value == 0 {
            self.isHidden = true
            return
        }

        self.numberOfMetacritic = value
    }
}

extension MetacriticScoreView {
    private func setupViews() {
        self.addSubview(containerStackView)
        
        containerStackView.addArrangedSubview(metascoreTitleLabel)
        containerStackView.addArrangedSubview(metaScoreContainer)
        
        metaScoreContainer.addSubview(metaScoreLabel)
    }
    
    private func setupConstraints() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        metaScoreLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(metaScoreContainer).inset(2)
            make.left.right.equalTo(metaScoreContainer).inset(8)
        }
    }
}
