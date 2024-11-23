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
    case dfResult(DFResultViewFeature)
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
            case let .router(.routeAction(id: .giftDay, action: .giftDay(.delegate(.touchBox(data, isValid))))):
                if isValid {
                    state.routes.push(.dfResult(DFResultViewFeature.State(purposeData: data)))
                } else {
                    state.routes.push(.challenge(ChallengeViewFeature.State(purposeData: data)))
                }
                
            case let .router(.routeAction(id: .challenge, action: .challenge(.delegate(.makeSuccess(isValid))))):
                if isValid {
                    state.routes.goBackToRoot()
                }
                
            case .router(.routeAction(id: .giftDay, action: .giftDay(.parentAction(.onAppear)))):
                return .send(.router(.routeAction(id: .giftDay, action: .giftDay(.parentAction(.onAppear)))))
                
            default:
                break
            }
            return .none
        }
        .forEachRoute(\.routes, action: \.router)
    }
}
