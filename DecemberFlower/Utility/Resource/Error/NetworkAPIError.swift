//
//  NetworkAPIError.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation

enum NetworkAPIError: Error {
    case routerError(RouterError)
    case netReError(NetReError)
//    case viewError(ViewError)
//    case realmError(RealmError)
}
