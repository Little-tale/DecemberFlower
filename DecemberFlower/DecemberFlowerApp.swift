//
//  DecemberFlowerApp.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import SwiftUI
import ComposableArchitecture

@main
struct DecemberFlowerApp: App {
    var body: some Scene {
        WindowGroup {
            RootCoordinatorView(store: Store(initialState: RootCoordinator.State.initialState, reducer: {
                RootCoordinator()
            }))
        }
    }
}
