//
//  DTOList.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/24/24.
//

import Foundation

struct DTOList<D: DTO>: DTO {
    
    let challengeList: [D]
    
    init(from decoder: any Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var elements = [D] ()
        while !container.isAtEnd {
            let element = try container.decode(D.self)
            elements.append(element)
        }
        self.challengeList = elements
    }
}
