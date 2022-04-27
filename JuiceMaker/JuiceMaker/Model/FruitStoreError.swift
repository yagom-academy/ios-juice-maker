//
//  StockError.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/26.
//

import Foundation

enum FruitStoreError: Error {
    case missingProduct
    case outOfStock
    case invalidAmount
}

extension FruitStoreError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .missingProduct:
            return NSLocalizedString("해당 상품이 없습니다", comment: "Description of missing Product")
        case .outOfStock:
            return NSLocalizedString("재고가 부족합니다", comment: "Description of out of stock")
        case .invalidAmount:
            return NSLocalizedString("잘못된 수량입니다", comment: "Description of invalid amount")
        }
    }
}
