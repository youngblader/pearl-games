//
//  TextLabel.swift
//  PearlGames
//
//  Created by Евгений Зорич on 27.10.23.
//

import UIKit

enum TypeLabel {
    case regular
    case semiBold
    case bold
    case extraBold
    case extraLight
    case light
    case black
    case medium
    case thin
}

enum ColorStyle {
    case white
    case black
    case gray
    case lightGray
    case textGray
    case borderColor
    case green
    case yellow
}

final class TextLabel: UILabel {
    private(set) var textLabel: String
    private(set) var color: ColorStyle
    private(set) var typeLabel: TypeLabel
    private(set) var size: CGFloat
    private(set) var aligment: NSTextAlignment
    private(set) var linesNumber: Int
    
    init(label: String = "", size: CGFloat = 16, color: ColorStyle = .white, typeLabel: TypeLabel = .semiBold, aligment: NSTextAlignment = .left, linesNumber: Int = 0) {
        
        self.textLabel = label
        self.size = size
        self.color = color
        self.typeLabel = typeLabel
        self.aligment = aligment
        self.linesNumber = linesNumber
        
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextLabel {
    private func configure() {
        configureLabelProperties()
        configureLabelStyle()
        configureLabelColor()
    }
    
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
        case .green:
            self.textColor = UIColor.green
        case .yellow:
            self.textColor = UIColor.yellow
        }
    }
    
    private func configureLabelStyle() {
        switch typeLabel {
        case .regular:
            self.font = UIFont(name: "Poppins-Regular", size: size)
        case .semiBold:
            self.font = UIFont(name: "Poppins-SemiBold", size: size)
        case .bold:
            self.font = UIFont(name: "Poppins-Bold", size: size)
        case .extraBold:
            self.font = UIFont(name: "Poppins-ExtraBold", size: size)
        case .extraLight:
            self.font = UIFont(name: "Poppins-ExtraLight", size: size)
        case .light:
            self.font = UIFont(name: "Poppins-Light", size: size)
        case .black:
            self.font = UIFont(name: "Poppins-Black", size: size)
        case .medium:
            self.font = UIFont(name: "Poppins-Medium", size: size)
        case .thin:
            self.font = UIFont(name: "Poppins-Thin", size: size)
        }
    }
    
    private func configureLabelProperties() {
        self.text = textLabel
        self.numberOfLines = linesNumber
        self.textAlignment = aligment
    }
}
