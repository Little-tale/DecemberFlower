//
//  NetReError.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation

enum NetReError: Error {
    case responseError
    case requestError
    case retryCountOver
    case timeOver
    case networkFail
    case unowned
}
