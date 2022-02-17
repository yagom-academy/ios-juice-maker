//
//  ErrorMessages.swift
//  JuiceMaker
//
//  Created by 추니 & Davy.
//

import Foundation

struct ErrorMessages {
    static let nonExistentFruitMessage = "과일이 존재하지 않습니다."
    static let outOfStockMessage = "재고가 부족합니다."
}

enum FruitError: String, Error {
    case outOfStock
    case nonExistentFruit
}

extension FruitError: LocalizedError {
    var description: String {
        switch self {
        case .nonExistentFruit:
            return ErrorMessages.nonExistentFruitMessage
        case .outOfStock:
            return ErrorMessages.outOfStockMessage
        }
    }
}
