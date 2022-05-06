//
//  StockError.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import Foundation

enum StockError: Error {
    case notEnoughIngredient
}

extension StockError {
    var message: String {
        switch self {
        case .notEnoughIngredient:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
