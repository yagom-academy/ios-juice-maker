//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/21.
//

import Foundation

enum FruitStoreError: Error {
    case stockShortage
    case stockDataMissing
    case invalidFruit
    case invalidModification
    case unexpectedStepperValue
}

extension FruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .stockShortage:
            return "재료가 모자라요. 재고를 수정할까요?"
        case .stockDataMissing:
            return "재고 정보가 없습니다."
        case .invalidFruit:
            return "유효하지 않은 과일입니다."
        case .invalidModification:
            return "재고를 수정할 수 없습니다."
        case .unexpectedStepperValue:
            return "재고를 수정할 수 없습니다."
        }
    }
}
