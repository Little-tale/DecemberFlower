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
    
    struct State: Equatable {
        let isFirstUser = false
    }
    
    enum Action {
        case viewCycle(ViewCycleType)
        case viewEvent(ViewEventType)
        case dataTrans(DataTransType)
        
        case delegate(Delegate)
        enum Delegate {
            case isFirstUser(Bool)
        }
    }
    
    enum ViewCycleType {
        case onAppear
    }
    
    enum ViewEventType {
        case buttonTapped
    }
    
    enum DataTransType {
        case none
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewCycle(.onAppear):
                UserDefaultsManager.isFirst = false
                
            case .viewEvent(.buttonTapped):
                // button 클릭시 Delegate로 UserDefault값 변경
                return .run { [state = state] send in
                    await send(.delegate(.isFirstUser(state.isFirstUser)))
                }
                
            default:
                break
            }
            
            return .none
        }
    }
}
