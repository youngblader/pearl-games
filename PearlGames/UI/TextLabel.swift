//
//  TextLabel.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

enum colorStyle {
    case white
    case black
    case gray
    case lightGray
    case textGray
    case borderColor
}

final class TextLabel: UILabel {
    public private(set) var textLabel: String
    public private(set) var color: colorStyle
    public private(set) var weight: UIFont.Weight
    public private(set) var size: CGFloat
    public private(set) var aligment: NSTextAlignment
    public private(set) var linesNumber: Int
    
    init(label: String = "", size: CGFloat = 16, color: colorStyle = colorStyle.black, weight: UIFont.Weight = .regular, aligment: NSTextAlignment = .left, linesNumber: Int = 0) {
        self.textLabel = label
        self.size = size
        self.color = color
        self.weight = weight
        self.aligment = aligment
        self.linesNumber = linesNumber
        
        super.init(frame: .zero)

        self.configureLabel()
        self.configureLabelColor()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextLabel {
    private func configureLabelColor() {
        switch color {
        case .black:
            self.textColor = UIColor.black
        case .gray:
            self.textColor = UIColor.gray
        case .lightGray:
            self.textColor = UIColor.lightGray
        case .textGray:
            self.textColor = UIColor.textGray
        case .borderColor:
            self.textColor = UIColor.borderColor
        case .white:
            self.textColor = UIColor.white
        }
    }
    
    private func configureLabel() {
        self.text = textLabel
        self.numberOfLines = linesNumber
        self.textAlignment = aligment
        self.font = UIFont.systemFont(ofSize: size, weight: weight)
    }
}
