//
//  DFResultViewFeature.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/24/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct DFResultViewFeature: _Reducer {
    
    @ObservableState
    struct State: Equatable {
        var purposeData: PurposeEntity
    }
    
    enum Action {
        case viewCycle(ViewCycleType)
        case viewEvent(ViewEventType)
        case dataTrans(DataTransType)
        case network(NetworkType)
        
        case delegate(Delegate)
        enum Delegate {
            case touchBox(PurposeEntity)
        }
        
        case detailTextBinding(String)
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
    
    enum NetworkType {
        case none
    }
    
    @Dependency(\.giftDayRepository) var giftDayRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case let .detailTextBinding(text):
                return .none
                
            default:
                break
            }
            return .none
        }
    }
}

