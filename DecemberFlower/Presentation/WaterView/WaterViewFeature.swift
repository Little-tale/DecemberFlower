//
//  WaterViewFeature.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct WaterViewFeature: _Reducer {
   
    @ObservableState
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
