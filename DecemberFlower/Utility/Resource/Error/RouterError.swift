//
//  RouterError.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation

enum RouterError: Error {
    case urlFail(url: String = "")
    case decodingFail
    case encodingFail
    case unknown
}
