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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Button("Next") {
            store.send(.viewEvent(.buttonTapped))
        }
    }
}

//#Preview {
//    OnboardingView()
//}
