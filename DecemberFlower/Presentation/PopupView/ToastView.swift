//
//  ToastView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/24/24.
//

import SwiftUI

struct ToastView: View {
    
    let text: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(text)
                    .font(style: .moneygraphy, size: 17)
                    .foregroundStyle(Color.white)
                    .padding(.vertical, 10)
                Spacer()
            }
        }
    }
}
