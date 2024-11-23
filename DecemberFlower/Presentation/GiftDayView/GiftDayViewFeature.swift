//
//  GiftDayViewFeature.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct GiftDayViewFeature: _Reducer {
    
    @ObservableState
    struct State: Equatable {
        var datas: [PurposeEntity] = Array(repeating: PurposeEntity(title: "", detail: ""), count: 31)
    }
    
    enum Action {
        case viewCycle(ViewCycleType)
        case viewEvent(ViewEventType)
        case dataTrans(DataTransType)
        case network(NetworkType)
        
        case delegate(Delegate)
        enum Delegate {
            case touchBox
        }
    }
    
    enum ViewCycleType {
        case onAppear
    }
    
    enum ViewEventType {
        case none
    }
    
    enum DataTransType {
        case giftDatas([PurposeEntity])
    }
    
    enum NetworkType {
        case giftDatas
    }
    
    @Dependency(\.giftDayRepository) var giftDayRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .viewCycle(.onAppear):
                return .run { send in
                    await send(.network(.giftDatas))
                }
                
            case .network(.giftDatas):
                return .run { send in
                    let data = try await giftDayRepository.fetchPurposeList()
                    
                    await send(.dataTrans(.giftDatas(data)))
                }
                
            case let .dataTrans(.giftDatas(data)):
                state.datas = data
                
            default:
                break
            }
            return .none
        }
    }
}
