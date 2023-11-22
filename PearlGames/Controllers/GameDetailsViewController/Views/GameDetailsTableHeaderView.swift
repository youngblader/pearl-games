//
//  GameDetailsTableHeaderView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 11.11.23.
//

import UIKit
import SnapKit
import SDWebImage

final class GameDetailsTableHeaderView: UIView {
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerViewHeight = NSLayoutConstraint()
    
    private var containerView = UIView()
  
    private let gameImageView: UIImageView = {
        let image = UIImageView()
        
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(offsetY + scrollView.contentInset.top, scrollView.contentInset.top)
    }
    
    //MARK: Public update
    func update(_ image: String) {
        gameImageView.sd_setImage(with: URL(string: image))
    }
}

#warning("Переписать layout на constraints")
extension GameDetailsTableHeaderView {
    func setupViews() {
        self.addSubview(containerView)
        containerView.addSubview(gameImageView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
        }
        
        // Container View Constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false

        containerView.widthAnchor.constraint(equalTo: gameImageView.widthAnchor).isActive = true
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        // ImageView Constraints
        gameImageView.translatesAutoresizingMaskIntoConstraints = false
        imageViewBottom = gameImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        
        imageViewBottom.isActive = true
        imageViewHeight = gameImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
    }
}
