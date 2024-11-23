//
//  DFFont.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import SwiftUI

enum DFFont: String {
    case moneygraphy = "Moneygraphy-Rounded"
    
    func font(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

extension Text {
    func font(style: DFFont, size: CGFloat) -> Text {
        return self.font(Font(style.font(size: size)))
    }
}
