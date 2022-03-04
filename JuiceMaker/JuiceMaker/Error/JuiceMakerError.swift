//
//  JuiceMakerError.swift
//  JuiceMaker
//
//  Created by 김태현 on 2022/02/22.
//

import Foundation

enum JuiceMakerError: Error {
    case notFoundFruit
    case notFoundMenu
    case notEnoughFruitAmount
}

extension JuiceMakerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFoundFruit:
            return "과일을 찾을 수 없습니다."
        case .notFoundMenu:
            return "메뉴를 찾을 수 없습니다."
        case .notEnoughFruitAmount:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
