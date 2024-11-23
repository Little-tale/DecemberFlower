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
}

extension GiftDayRepository {
    func fetchPurposeList() async throws -> [PurposeEntity] {
        let data = try await network.requestNetwork(dto: DTOList<PurposeDTO>.self, router: GiftDayRouter.fetchPurposeList)
        
        return dtoToEntity(data.elements)
    }
    
    func pushPurpose(data: PurposeEntity) async throws {
        try await network.requestNetwork(dto: PurposeDTO.self, router: GiftDayRouter.pushPurpose(purpose: data))
    }
}

extension GiftDayRepository {
    private func dtoToEntity(_ dtos: [PurposeDTO]) -> [PurposeEntity] {
        return dtos.map { dtoToEntity($0) }
    }
    
    private func dtoToEntity(_ dto: PurposeDTO) -> PurposeEntity {
        return PurposeEntity(title: dto.title, detail: dto.detail)
    }
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
