//
//  RootCoordinatorView.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct RootCoordinatorView: View {
    
    @Perception.Bindable var store: StoreOf<RootCoordinator>
    
    var body: some View {
        WithPerceptionTracking {
            
            switch store.viewState {
            case .start:
                TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
                    switch screen.case {
                    case let .onboarding(store):
                        OnboardingView(store: store)
                    }
                }
                
            case .home:
                TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
                    switch screen.case {
                    case let .onboarding(store):
                        OnboardingView(store: store)
                    }
                }
            }
            
        }
    }
}

extension RootScreen.State: Identifiable {
    var id: ID {
        switch self {
        case .onboarding:
            return .onboarding
        }
    }
    
    enum ID: Identifiable {
        case onboarding
        
        var id: ID {
            return self
        }
    }
}
