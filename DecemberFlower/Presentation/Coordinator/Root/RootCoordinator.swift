//
//  RootCoordinator.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import ComposableArchitecture
@preconcurrency import TCACoordinators

@Reducer(state: .equatable)
enum RootScreen {
    case onboarding(OnboardingViewFeature)
}

@Reducer
struct RootCoordinator: Reducer {
    
    @ObservableState
    struct State: Equatable, Sendable {
        static let initialState = State(routes: [.root(.onboarding(OnboardingViewFeature.State()), embedInNavigationView: true)])
        
        var routes: IdentifiedArrayOf<Route<RootScreen.State>>
        var viewState: RootCoordinatorViewState = .start
    }

    enum Action {
        case router(IdentifiedRouterActionOf<RootScreen>)
    }
    
    enum RootCoordinatorViewState: Equatable {
        case start
        case home
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            switch action {
            case let .router(.routeAction(id: _, action: .onboarding(.delegate(.isFirstUser(trigger))))):
                if trigger {
                    state.routes.push(.onboarding(OnboardingViewFeature.State()))
                } else {
                    state.viewState = .home
                }
                
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
