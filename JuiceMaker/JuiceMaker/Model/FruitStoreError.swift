//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

enum FruitStoreError: Error {
    case wrongAmount
    case notInFruitList
    case outOfStock
    
    var failureReason: String {
        switch self {
        case .wrongAmount:
            return "잘못된 수량입니다."
        case .notInFruitList:
            return "목록에 없는 과일입니다."
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}
