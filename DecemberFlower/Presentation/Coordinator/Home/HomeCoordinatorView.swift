//
//  HomeCoordinatorView.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import SwiftUI
import ComposableArchitecture
import TCACoordinators

struct HomeCoordinatorView: View {
    
    @Perception.Bindable var store: StoreOf<HomeCoordinator>
    
    var body: some View {
        WithPerceptionTracking {
            TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
                switch screen.case {
                case let .giftDay(store):
                    GiftDayView(store: store)
                case let .challenge(store):
                    ChallengeView(store: store)
                case let .dfResult(store):
                    DFResultView(store: store)
                }
            }
        }
    }
}

extension HomeScreen.State: Identifiable {
    var id: ID {
        switch self {
        case .giftDay:
            return .giftDay
        case .challenge:
            return .challenge
        case .dfResult:
            return .dfResult
        }
    }
    
    enum ID: Identifiable {
        case giftDay
        case challenge
        case dfResult
        
        var id: ID {
            return self
        }
    }
}
