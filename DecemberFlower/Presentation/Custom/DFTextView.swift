//
//  DFTextView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

struct DFTextView: View {
    @Binding var text: String
    let backgroundColor: Color
    let placeHolder: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // 입력 필드
            ZStack(alignment: .topLeading) {
                // 배경
                backgroundColor
                    .frame(maxWidth: .infinity)
                
                if text.isEmpty {
                    Text(placeHolder)
                        .foregroundColor(.white.opacity(0.5))
                        .padding(.horizontal, 14)
                        .padding(.top, 14)
                }
                
                // 텍스트 입력 필드
                TextEditor(text: $text)
                    .foregroundColor(.white)
                    .padding(8)
                    .frame(maxHeight: .infinity)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
            }
        }
    }
}


#if DEBUG
//#Preview {
//    DFTextView(text: "", backgroundColor: .gray, placeHolder: "미리보기 히히", characterLimit: 300)
//}
#endif
