//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by Karen, myungsun on 2023/05/09.
//

import Foundation

enum FruitStoreError: Error, LocalizedError {
    case outOfStock
    
    var errorDescription: String? {
        switch self {
        case.outOfStock:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
}
