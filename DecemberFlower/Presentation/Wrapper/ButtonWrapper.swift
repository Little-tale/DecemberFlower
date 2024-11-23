//
//  ButtonWrapper.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct ButtonWrapper: ViewModifier {
    
    let action: () -> Void
    
    func body(content: Content) -> some View {
        Button(
            action:action,
            label: { content }
        )
    }
}

extension View {
    func asButton(action: @escaping () -> Void ) -> some View {
        return self
            .modifier(ButtonWrapper(action: action))
    }
}
