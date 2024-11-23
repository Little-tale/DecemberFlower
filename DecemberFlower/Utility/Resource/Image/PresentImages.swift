//
//  PresentImages.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/24/24.
//

import SwiftUI

enum PresentImages: Int, CaseIterable {
    
    case box1 = 1
    case box2
    case box3
    case box4
    
    var image: Image {
        switch self {
        case .box1:
            return Image(.boxDone1)
        case .box2:
            return Image(.boxDone2)
        case .box3:
            return Image(.boxDone3)
        case .box4:
            return Image(.boxDone4)
        }
    }
    
}
