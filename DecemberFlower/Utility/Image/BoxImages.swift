//
//  BoxImages.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

enum BoxImages: Int, CaseIterable {
    
    case box1 = 1
    case box2
    case box3
    case box4
    
    var image: Image {
        switch self {
        case .box1:
            return Image(.box1)
        case .box2:
            return Image(.box2)
        case .box3:
            return Image(.box3)
        case .box4:
            return Image(.box4)
        }
    }
    
}
