//
//  AppIconsCollectionView.swift
//  PearlGames
//
//  Created by Евгений Зорич on 10.10.23.
//

import UIKit

struct AppIcon {
    var title: String
    var imageName: String
}

final class AppIconsCollectionView: UICollectionView {
    private let appIcons: [AppIcon] = [AppIcon(title: "Default", imageName: "AppIcon 1"), AppIcon(title: "Mosaic", imageName: "AppIcon 2"), AppIcon(title: "Pearlescent", imageName: "AppIcon 3"), AppIcon(title: "Sunset", imageName: "AppIcon 4"), AppIcon(title: "Stipple", imageName: "AppIcon 5")]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 90)
        layout.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        self.layer.cornerRadius = 10
        self.backgroundColor = .lightBlack
        
        self.delegate = self
        self.dataSource = self
        
        self.register(AppIconCell.self, forCellWithReuseIdentifier: AppIconCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AppIconsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        
        let appIcon = appIcons[indexPath.row]
        
        cell?.showAnimation {
            UIApplication.shared.setAlternateIconName(appIcon.imageName)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appIcons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppIconCell.reuseId, for: indexPath) as! AppIconCell
        
        let appIcon = appIcons[indexPath.row]
        
        cell.update(appIcon)
        
        return cell
    }
}
