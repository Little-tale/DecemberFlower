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
        var datas: [String] = (1...31).map { String($0) }
    }
    
    enum Action {
        case viewCycle(ViewCycleType)
        case viewEvent(ViewEventType)
        case dataTrans(DataTransType)
        case network(NetworkType)
    }
    
    enum ViewCycleType {
        case onAppear
    }
    
    enum ViewEventType {
        case none
    }
    
    enum DataTransType {
        case giftDatas(TestDTO)
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
                state.datas = [""]
                
                
            default:
                break
            }
            return .none
        }
    }
}
