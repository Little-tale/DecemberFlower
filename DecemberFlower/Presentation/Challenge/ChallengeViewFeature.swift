//
//  ChallengeViewFeature.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/24/24.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ChallengeViewFeature: _Reducer {
    
    @ObservableState
    struct State: Equatable {
        var titleText: String = ""
        var detailText: String = ""
        
        var titleIsValid: Bool = false
        var detailIsValid: Bool = false
        var allIsValid: Bool = false
        
        var titleCount: Int = 0
        var detailCount: Int = 0
        
        let titleLimit = 20
        let detailLimit = 200
    }
    
    enum Action {
        case viewCycle(ViewCycleType)
        case viewEvent(ViewEventType)
        case dataTrans(DataTransType)
        case network(NetworkType)
        
        // binding
        case titleTextBinding(String)
        case detailTextBinding(String)
    }
    
    enum ViewCycleType {
        case onAppear
    }
    
    enum ViewEventType {
        case buttonTapped
        case none
    }
    
    enum DataTransType {
        case giftDatas(PurposeEntity)
    }
    
    enum NetworkType {
        case giftDatas
    }
    
    @Dependency(\.giftDayRepository) var giftDayRepository
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .viewEvent(.buttonTapped):
                return .run { [state = state] send in
                    try await giftDayRepository.pushPurpose(data: PurposeEntity(title: state.titleText, detail: state.detailText))
                }
                
            case let .titleTextBinding(text):
                state.titleText = limitText(to: text, limit: state.titleLimit)
                state.titleCount = calculateCharacterCount(for: state.titleText)
                state.titleIsValid = state.titleCount <= state.titleLimit
                
                state.allIsValid = (state.titleIsValid && state.detailIsValid == true)
                
            case let .detailTextBinding(text):
                state.detailText = limitText(to: text, limit: state.detailLimit)
                state.detailCount = calculateCharacterCount(for: state.detailText)
                state.detailIsValid = state.detailCount <= state.detailLimit
                
                state.allIsValid = (state.titleIsValid && state.detailIsValid == true)

            default:
                break
            }
            return .none
        }
    }
    
    // 정규표현식으로 글자 수 계산
    private func limitText(to input: String, limit: Int) -> String {
        var currentText = ""
        var currentCount = 0
        let newlinePenalty = 2
        
        for char in input {
            let str = String(char)
            if str == "\n" {
                currentCount += newlinePenalty
            } else {
                currentCount += 1
            }
            
            if currentCount > limit {
                break
            }
            currentText.append(char)
        }
        
        return currentText
    }
    
    // 문자 제한을 넘지 않도록 텍스트 자르기
    private func calculateCharacterCount(for input: String) -> Int {
        let newlinePenalty = 2
        
        let newlineRegex = try! NSRegularExpression(pattern: "\n")
        let newlineMatches = newlineRegex.numberOfMatches(in: input, range: NSRange(location: 0, length: input.utf16.count))
        let adjustedNewlineCount = newlineMatches * newlinePenalty
        let characterCount = input.replacingOccurrences(of: "\n", with: "").count
        return characterCount + adjustedNewlineCount
    }
}

extension ChallengeViewFeature {

}
