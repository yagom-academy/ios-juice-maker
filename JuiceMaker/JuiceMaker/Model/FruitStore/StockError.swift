//
//  StockError.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/05/02.
//

import Foundation

enum StockError: String, LocalizedError {
    case notEnoughIngredient = "재료가 모자라요. 재고를 수정할까요?"
    var errorDescription: String? {
        self.rawValue
    }
}
