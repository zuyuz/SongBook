//
//  UIFont+extensions.swift
//  SongBook
//
//  Created by Julia Zvizlo on 5/20/19.
//  Copyright © 2019 Mrrrnyaaa. All rights reserved.
//

import UIKit

enum SFTextStyle: String {
    
    case semiBold = "SFUIText-Semibold"
    case regular = "SFUIText-Regular"
    case medium = "SFUIText-Medium"
}

enum FontSize: CGFloat {
    
    case regular = 13
    case medium = 15
    case mediumLarge = 17
    case extra = 20
    case extraLarge = 26
    case superLarge = 40
}

extension UIFont {

    class func sfTextStyleAndSize(style: SFTextStyle, size: FontSize) -> UIFont {
        return fontWith(style: style.rawValue, size: size)
    }
    
    class func fontWith(style: String, size: FontSize) -> UIFont {
        return UIFont(name: style, size: size.rawValue)!
    }
}
