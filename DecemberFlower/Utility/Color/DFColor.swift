//
//  DFColor.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import UIKit


enum DFColor {
    
    enum MainColor {
        case gray600
        case gray500
        case gray400
        
        var color: UIColor {
            switch self {
            case .gray600:
                return UIColor(hexCode: "1D1A1B")
            case .gray500:
                return UIColor(hexCode: "8A8889")
            case .gray400:
                return UIColor(hexCode: "A5A3A4")
            }
        }
    }
    
    enum GrayColor {
        case gray300
        case gray200
        case gray100
        
        var color: UIColor {
            switch self {
            case .gray300:
                return UIColor(hexCode: "CDCDCD")
            case .gray200:
                return UIColor(hexCode: "E9EAEA")
            case .gray100:
                return UIColor(hexCode: "FBFBFB")
            }
        }
    }
    
}




extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}