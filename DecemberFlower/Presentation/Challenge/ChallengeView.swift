//
//  ChallengeView.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

enum TextViewCase: CaseIterable {
    case title
    case detail
    
    var title: String {
        switch self {
        case .title:
            return "목표 제목"
        case .detail:
            return DFText.ChallengeText.titleDetail
        }
    }
    
    var placeHolder: String {
        switch self {
        case .title:
            return DFText.ChallengeText.placeTitle
        case .detail:
            return DFText.ChallengeText.placeDetail
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
    
    @Perception.Bindable var store: StoreOf<ChallengeViewFeature>
    
    @State private var text: String = "" // 사용자 입력 값을 저장
    let characterLimit = 300 // 문자 제한
    
    var body: some View {
        WithPerceptionTracking {
            ScrollView {
                
                WithPerceptionTracking {
                    VStack {
                        HStack {
                            Text(DFText.ChallengeText.setPurpose)
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
                            
                            switch textViewCase {
                            case .title:
                                DFTextView(text: $store.titleText.sending(\.titleTextBinding), backgroundColor: Color(DFColor.GrayColor.textView.color), placeHolder: textViewCase.placeHolder)
                                    .frame(height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.horizontal, 10)
                            
                                bottomView(current: textViewCase)
                                    .foregroundStyle(store.state.titleIsValid ? .clear : .red)
                            case .detail:
                                DFTextView(text: $store.detailText.sending(\.detailTextBinding), backgroundColor: Color(DFColor.GrayColor.textView.color), placeHolder: textViewCase.placeHolder)
                                    .frame(height: 200)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .padding(.horizontal, 10)
                                
                                bottomView(current: textViewCase)
                                    .foregroundStyle(store.state.titleIsValid ? .clear : .red)
                            }
                            
                            
                        }
                    }
                    
                    VStack {
                        Text(DFText.ChallengeText.completePurpose)
                            .font(style: .moneygraphy, size: 18)
                            .foregroundStyle(store.allIsValid ? .white : .gray) // 조건에 따른 색 변경알아서
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
        //            .background(DFColor.PointColor.point1) // 조건에 따른 색 변경알아서
                    .background(Color(DFColor.PointColor.point1.color))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal, 10)
                }
                
                
            }
            .onAppear {
                store.send(.viewCycle(.onAppear))
            }
            .background {
                WithPerceptionTracking {
                    ZStack {
                        Image(.background)
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .ignoresSafeArea(.all)
                }
            }
        }
        
    }
    
    
    private func bottomView(current: TextViewCase) -> some View {
        HStack {
            // 피처에서 각 케이스가 true false 에 따른 처리 ( 븀보시면 암 위에것도 처리)
            let isTitle = current == .title
            let text = isTitle ? DFText.ChallengeText.warningTitle : DFText.ChallengeText.warningDetail
            let count = isTitle ? store.state.titleCount : store.state.detailCount
            let limit = isTitle ? store.state.titleLimit : store.state.detailLimit
            
            Text(text)
        }
    }
}





//#if DEBUG
//#Preview {
//    ChallengeView()
//}
//#endif
