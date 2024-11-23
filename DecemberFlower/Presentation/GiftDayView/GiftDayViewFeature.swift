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
        var datas: [PurposeEntity] = []
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
    }
    
    enum ViewCycleType {
        case onAppear
    }
    
    enum ViewEventType {
        case touchBox(Int)
        case none
    }
    
    enum DataTransType {
        case emptyData
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
                    await send(.dataTrans(.emptyData))
                    await send(.network(.giftDatas))
                }
                
            case let .viewEvent(.touchBox(index)):
                return .run { [state = state] send in
                    await send(.delegate(.touchBox(state.datas[index])))
                }
                
            case .network(.giftDatas):
                return .run { send in
                    let data = try await giftDayRepository.fetchPurposeList()
                    
                    await send(.dataTrans(.giftDatas(data)))
                }
                
            case .dataTrans(.emptyData):
                var items: [PurposeEntity] = []
                
                for index in 1...31 {
                    items.append(PurposeEntity(title: "", details: "", number: index, isValid: false, createdAt: Date()))
                }
                state.datas = items
                
            case let .dataTrans(.giftDatas(datas)):
                for data in datas {
                    state.datas[data.number-1] = data
                }
                
            default:
                break
            }
            return .none
        }
    }
}
