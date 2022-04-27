//
//  StockError.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/26.
//

enum JuiceMakerError: Error {
    case missingProduct
    case outOfStock
}

extension JuiceMakerError {
    var message: String {
        switch self {
        case .missingProduct:
            return "해당 상품이 없습니다"
        case .outOfStock:
            return "재고가 부족합니다"
        }
    }
}
