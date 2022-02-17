//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Jinyoung Kim on 2022/02/15.
//

import Foundation

enum FruitStoreError: Error {
    case outOfStock([Fruit])
    case invalidStockChange
    case unkown
}

extension FruitStoreError {
    var errorDescription: String? {
        switch self {
        case .outOfStock(let outOfStockFruits):
            let outOfStockFruitsString = outOfStockFruits.map({ $0.name }).joined(separator: ", ")
            return "\(outOfStockFruitsString)의 재고가 부족합니다."
        case .unkown:
            return "알 수 없는 문제가 발생했습니다."
        case .invalidStockChange:
            return "재고는 음수가 될 수 없습니다."
        }
    }
}
