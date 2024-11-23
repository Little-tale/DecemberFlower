//
//  GiftDayRepository.swift
//  DecemberFlower
//
//  Created by 김진수 on 11/23/24.
//

import Foundation
import ComposableArchitecture

final class GiftDayRepository: @unchecked Sendable {
    @Dependency(\.networkManager) var network
//    @Dependency(\.characterMapper) var mapper
}

extension GiftDayRepository {
    func fetchPurposeList() async throws -> TestDTO {
        try await network.requestNetwork(dto: TestDTO.self, router: GiftDayRouter.fetchPurposeList)
    }
}

struct TestDTO: DTO {
    
}

extension GiftDayRepository: DependencyKey {
    static let liveValue: GiftDayRepository = GiftDayRepository()
}

extension DependencyValues {
    var giftDayRepository: GiftDayRepository {
        get { self[GiftDayRepository.self] }
        set { self[GiftDayRepository.self] = newValue }
    }
}
