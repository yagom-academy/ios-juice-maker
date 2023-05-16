//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

import Foundation

enum FruitStoreError: Error {
    case notFoundFruit(Fruit)
    case notEnoughStock(Fruit)
    case unknown
}

extension FruitStoreError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .notFoundFruit(let fruit):
            return "\(fruit)을 찾을 수 없습니다."
        case .notEnoughStock(_):
            return "재료가 모자라요. 재고를 수정할까요?"
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
}
