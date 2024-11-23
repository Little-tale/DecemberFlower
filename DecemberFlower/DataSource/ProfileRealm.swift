//
//  ProfileRealm.swift
//  DecemberFlower
//
//  Created by Jae hyung Kim on 11/23/24.
//

import Foundation
import RealmSwift

final class ProfileRealm: Object {
    @Persisted(primaryKey: true) var email: String
    @Persisted var name: String
    
    convenience
    init(email: String, name: String) {
        self.init()
        self.email = email
        self.name = name
    }
}
