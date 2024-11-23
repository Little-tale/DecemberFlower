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
}

extension GiftDayRouter {
    var method: HTTPMethod {
        switch self {
        case .fetchPurposeList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .fetchPurposeList:
            return ""
        }
    }
    
    var optionalHeaders: HTTPHeaders? {
        switch self {
        case .fetchPurposeList:
            return HTTPHeaders([
                HTTPHeader(name: "Content-Type", value: "application/json")
            ])
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .fetchPurposeList:
            return nil
        }
    }
    
    var body: Data? {
        switch self {
        case .fetchPurposeList:
            return nil
        }
    }
    
    var encodingType: EncodingType {
        switch self {
        case .fetchPurposeList:
            return .url
        }
    }
}
