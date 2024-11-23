//
//  BottomShadow.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct BottomShadow: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    colors: [
                        Color.black.opacity(0),
                        Color.black.opacity(0),
                        Color.black.opacity(0),
                        Color.black.opacity(0),
                        Color.black.opacity(0),
                        Color.black.opacity(0),
                        Color.black.opacity(0.3),
                        Color.black.opacity(0.5)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}

extension View {
    var bottomShadow: some View {
        return self
            .modifier(BottomShadow())
    }
}
