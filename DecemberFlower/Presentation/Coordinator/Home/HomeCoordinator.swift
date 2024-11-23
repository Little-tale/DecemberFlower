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
    
}

@Reducer
struct HomeCoordinator: Reducer {
    
    @ObservableState
    struct State: Equatable, Sendable {

    }

    enum Action {
        
    }
    
    var body: some ReducerOf<Self> {
        
        Reduce { state, action in
            return .none
        }
//        .forEachRoute(\.routes, action: \.router)
    }
}
