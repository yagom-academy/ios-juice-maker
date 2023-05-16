//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

import Foundation

enum FruitStoreError: Error {
    case notEnoughStock(Fruit)
    case unknown
}

extension FruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notEnoughStock(_):
            return "재료가 모자라요. 재고를 수정할까요?"
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
    
    var errorTitle: String {
        switch self {
        case .notEnoughStock(_):
            return "재고 부족"
        case .unknown:
            return "시스템 에러"
        }
    }
}
