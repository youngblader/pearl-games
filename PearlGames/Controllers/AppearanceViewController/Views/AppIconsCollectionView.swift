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
    private let appIcons: [AppIcon] = [AppIcon(title: "Default", imageName: ""), AppIcon(title: "Mosaic", imageName: ""), AppIcon(title: "Stipple", imageName: "")]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        layout.itemSize = CGSize(width: 40, height: 40)
        
        //        layout.minimumLineSpacing = 16
        
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.showsHorizontalScrollIndicator = false
        self.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        self.layer.cornerRadius = 12
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.alpha = 0
        
        UIView.animate(withDuration: 1.0) {
            cell.alpha = 1
        }
    }
    
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
