//
//  OnboardingViewFeature.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct OnboardingViewFeature: _Reducer {
    
    struct State {
        
    }
    
    enum Action {
        case viewCycle(ViewCycleType)
        case viewEvent(ViewEventType)
        case dataTrans(DataTransType)
    }
    
    enum ViewCycleType {
        case onAppear
    }
    
    enum ViewEventType {
        case none
    }
    
    enum DataTransType {
        case none
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            default:
                break
            }
            
            return .none
        }
    }
}
