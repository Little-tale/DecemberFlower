//
//  UserDefaultsManager.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation

final actor UserDefaultsManager {
    
    enum Key: String {
        case isFirst
        
        var value: String {
            return self.rawValue
        }
    }
    
    @UserDefaultsWrapper(key: Key.isFirst.value, placeValue: true)
    static var isFirst: Bool
}
