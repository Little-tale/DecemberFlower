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
    struct State: Equatable {
        static let initialState = State(routes: [.root(.onboarding(OnboardingViewFeature.State()), embedInNavigationView: false)])
        
        var routes: IdentifiedArrayOf<Route<RootScreen.State>>
        var viewState: RootCoordinatorViewState = .start
        var homeCoordinator: HomeCoordinator.State = HomeCoordinator.State.initialState
    }

    enum Action {
        case router(IdentifiedRouterActionOf<RootScreen>)
        
        case homeCoordinatorAction(HomeCoordinator.Action)
    }
    
    enum RootCoordinatorViewState: Equatable {
        case start
        case home
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.homeCoordinator, action: \.homeCoordinatorAction) {
            HomeCoordinator()
        }
        
        Reduce { state, action in
            switch action {
            case let .router(.routeAction(id: .onboarding, action: .onboarding(.delegate(.isFirstUser(trigger))))):
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
