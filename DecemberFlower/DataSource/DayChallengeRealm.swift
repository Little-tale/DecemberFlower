//
//  DayChallengeRealm.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import Foundation
import RealmSwift

final class DayChallengeRealm: Object {
    @Persisted(primaryKey: true) var day: Int
    @Persisted var challenge: String
    @Persisted var isCompleted: Bool
    
    convenience
    init(day: Int, challenge: String, isCompleted: Bool = false) {
        self.init()
        self.day = day
        self.challenge = challenge
        self.isCompleted = isCompleted
    }
    
}
