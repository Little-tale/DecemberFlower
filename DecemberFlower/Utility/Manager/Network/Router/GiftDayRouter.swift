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
    case pushPurpose(purpose: PurposeEntity)
}

extension GiftDayRouter {
    var method: HTTPMethod {
        switch self {
        case .fetchPurposeList:
            return .get
        case .pushPurpose:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .fetchPurposeList, .pushPurpose:
            return ""
        }
    }
    
    var optionalHeaders: HTTPHeaders? {
        switch self {
        case .fetchPurposeList, .pushPurpose:
            return HTTPHeaders([
                HTTPHeader(name: "Content-Type", value: "application/json")
            ])
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchPurposeList, .pushPurpose:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .fetchPurposeList, .pushPurpose:
            return nil
        }
    }
    
    var encodingType: EncodingType {
        switch self {
        case .fetchPurposeList, .pushPurpose:
            return .url
        }
    }
}
