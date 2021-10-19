//
//  JuiceMakeError.swift
//  JuiceMaker
//
//  Created by Sunwoo on 2021/10/19.
//

import Foundation

enum JuiceMakeError: Error, LocalizedError {
    case invaildKey
    case outOfStock(fruit: FruitStore.Fruit, amount: Int)
    
    var errorDescription: String? {
        switch self {
        case .invaildKey:
            return "Dictionary의 Key가 유효하지 않습니다."
        case let .outOfStock(fruit, amount):
            return "\(fruit)재고가 \(amount)개 부족합니다."
        }
    }
}

