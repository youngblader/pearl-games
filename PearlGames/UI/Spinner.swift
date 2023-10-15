//
//  Spinner.swift
//  PearlGames
//
//  Created by Евгений Зорич on 9.10.23.
//

import UIKit

final class Spinner: UIActivityIndicatorView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.startAnimating()
        self.hidesWhenStopped = true
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
