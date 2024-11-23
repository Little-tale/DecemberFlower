//
//  ChallengeView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI

enum TextViewCase: CaseIterable {
    case title
    case detail
    
    var title: String {
        switch self {
        case .title:
            return "목표 제목"
        case .detail:
            return "자세한 목표 제공"
        }
    }
    
    var placeHolder: String {
        switch self {
        case .title:
            return "물 1잔 마시기와 같은 가벼운 목표도 좋아요"
        case .detail:
            return "자세한 내용은 작성하지 않으셔도 괜찮아요. (선택사항)"
        }
    }
    
    var height: CGFloat {
        switch self {
        case .title:
            return 100
        case .detail:
            return 300
        }
    }
    
    var limit: Int {
        switch self {
        case .title:
            return 20
        case .detail:
            return 300
        }
    }
}

struct ChallengeView: View {
    
    @State private var text: String = "" // 사용자 입력 값을 저장
    let characterLimit = 300 // 문자 제한
    
    var body: some View {
        ScrollView {
            
            VStack {
                HStack {
                    Text("오늘의\n목표를 정해보세요")
                        .font(style: .moneygraphy, size: 36)
                    Spacer()
                }
                .padding(.leading, 10)
                .padding(.bottom, 15)
                .foregroundStyle(.white)
                
                ForEach(TextViewCase.allCases, id: \.self) { textViewCase in
                    HStack {
                        Text(textViewCase.title)
                            .font(style: .moneygraphy, size: 18)
                        Spacer()
                    }
                    .foregroundStyle(.white)
                    .padding(.leading, 10)
                    .padding(.vertical, 3)
                    
                    DFTextView(text: $text, backgroundColor: Color(DFColor.GrayColor.textView.color), placeHolder: textViewCase.placeHolder)
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.horizontal, 10)
                    bottomView(current: textViewCase)
                }
            }
            
            VStack {
                Text("이렇게 목표 설정할께요")
                    .font(style: .moneygraphy, size: 18)
                    .foregroundStyle(.white) // 조건에 따른 색 변경알아서
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
//            .background(DFColor.PointColor.point1) // 조건에 따른 색 변경알아서
            .background(Color(DFColor.PointColor.point1.color))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.horizontal, 10)
            
        }
        .background {
            ZStack {
                Image(.background)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all)
        }
    }
    
    
    private func bottomView(current: TextViewCase) -> some View {
        HStack {
            // 피처에서 각 케이스가 true false 에 따른 처리 ( 븀보시면 암 위에것도 처리)
            Text("여기에 경고 문구")
        }
    }
}





#if DEBUG
#Preview {
    ChallengeView()
}
#endif
