//
//  OnboardingView.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

struct OnboardingView: View {
    
    @Perception.Bindable var store: StoreOf<OnboardingViewFeature>
    
    var body: some View {
        VStack(spacing: 10) {
            
            Spacer()
            Group {
                Text("12월 마지막 도전")
                    .font(style: .moneygraphy, size: 40)
                Text("D31")
                    .font(style: .moneygraphy, size: 62)
                Text("과 함께해요")
                    .font(style: .moneygraphy, size: 40)
            }
            .foregroundStyle(.white)
            
            Image(.boxEnd)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)

            
            Spacer()
            
            VStack {
                Text("시작하기")
                    .foregroundStyle(.white)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .background(Color(DFColor.PointColor.point1.color))
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .asButton {
                store.send(.viewEvent(.buttonTapped))
            }
            .padding(.all, 20)
            .padding(.bottom, 20)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            ZStack {
                Image(.background)
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    OnboardingView(store: Store(initialState: OnboardingViewFeature.State(), reducer: {
        OnboardingViewFeature()
    }))
}
