//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

import Foundation

enum FruitStoreError: Error {
    case notEnoughStock(Fruit)
    case notFoundFruit
    case unknown
}

extension FruitStoreError: ErrorExplainable {
    var title: String {
        switch self {
        case .notEnoughStock(_):
            return "재고 부족"
        case .notFoundFruit:
            return "존재하지 않는 과일"
        case .unknown:
            return "시스템 에러"
        }
    }
    
    var description: String {
        switch self {
        case .notEnoughStock(_):
            return "재료가 모자라요. 재고를 수정할까요?"
        case .notFoundFruit:
            return "해당 과일을 찾을 수 없습니다."
        case .unknown:
            return "알 수 없는 에러입니다."
        }
    }
}
