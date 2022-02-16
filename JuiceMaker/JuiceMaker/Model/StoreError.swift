//
//  StoreError.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/16.
//

import Foundation

enum StoreError: Error {
    case notExistStuff(name: String)
    case outOfStock
    case notEnoughStock(name: String, stock: Int)
}

extension StoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notExistStuff(name: let name):
            return "해당 \(name)이 존재하지 않습니다."
        case .outOfStock:
            return "재고가 없습니다."
        case .notEnoughStock(let name, let stock):
            return "해당 \(name)의 재고가 \(stock) 밖에 남지 않았습니다."
        }
    }
}
