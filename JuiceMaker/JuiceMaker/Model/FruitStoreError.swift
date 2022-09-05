//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

enum FruitStoreError: Error {
    case invalidAmount
    case notInInventoryFruitList
    case outOfStock
    case unexpectedError
    
    var failureReason: String {
        switch self {
        case .invalidAmount:
            return "잘못된 수량입니다."
        case .notInInventoryFruitList:
            return "창고 내부 목록에 없는 과일입니다."
        case .outOfStock:
            return "재고가 부족합니다."
        case .unexpectedError:
            return "예상하지 못한 에러입니다."
        }
    }
}
