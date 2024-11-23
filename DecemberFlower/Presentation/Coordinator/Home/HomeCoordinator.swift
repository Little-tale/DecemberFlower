//
//  HomeCoordinator.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import ComposableArchitecture
@preconcurrency import TCACoordinators

@Reducer(state: .equatable)
enum HomeScreen {
    case giftDay(GiftDayViewFeature)
    case challenge(ChallengeViewFeature)
}

@Reducer
struct HomeCoordinator: Reducer {
    
    @ObservableState
    struct State: Equatable {
        static let initialState = State(routes: [.root(.giftDay(GiftDayViewFeature.State()), embedInNavigationView: true)])
        
        var routes: IdentifiedArrayOf<Route<HomeScreen.State>>
    }

    enum Action {
        case router(IdentifiedRouterActionOf<HomeScreen>)
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case let .router(.routeAction(id: .giftDay, action: .giftDay(.delegate(.touchBox(data))))):
                state.routes.push(.challenge(ChallengeViewFeature.State(purposeData: data)))
                
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
