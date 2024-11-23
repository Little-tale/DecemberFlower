//
//  GiftDayRouter.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import Alamofire

enum GiftDayRouter: Router {
    case fetchPurposeList
    case pushPurpose(purpose: PurposeEntity, challengeDay: Int)
    case fetchPurpose(challengeDay: Int)
}

extension GiftDayRouter {
    var method: HTTPMethod {
        switch self {
        case .fetchPurposeList, .fetchPurpose:
            return .get
        case .pushPurpose:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .fetchPurposeList:
            return "challenges/challengeAll"
        case .pushPurpose(_,let day), .fetchPurpose(challengeDay: let day):
            return "challenges/\(day)"
        }
    }
    
    var optionalHeaders: HTTPHeaders? {
        switch self {
        case .fetchPurposeList, .pushPurpose, .fetchPurpose:
            return HTTPHeaders([
                HTTPHeader(name: "Content-Type", value: "application/json")
            ])
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchPurposeList, .pushPurpose, .fetchPurpose:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .fetchPurposeList, .fetchPurpose:
            return nil
        case let .pushPurpose(purpose: entity, challengeDay: _):
            let data = try? CodableManager.shared.jsonEncoding(from: RequestDTO(title: entity.title, description: entity.details))
            return data
        }
    }
    
    var encodingType: EncodingType {
        switch self {
        case .fetchPurposeList, .fetchPurpose:
            return .url
        case .pushPurpose:
            return .json
        }
    }
}
