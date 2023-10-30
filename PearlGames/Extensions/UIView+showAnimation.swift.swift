//
//  UIView+showAnimation.swift.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

extension UIView {
    func showAnimation(_ completion: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.96, y: 0.96)
        }) { (done) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: { [weak self] in
                //self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self?.transform = CGAffineTransform.identity
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completion()
            }
        }
    }
}
