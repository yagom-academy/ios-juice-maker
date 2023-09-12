//
//  FruitStoreError.swift
//  JuiceMaker
//  Created by mireu,charles on 2023/09/12.
//

enum FruitStoreError: Error, CustomStringConvertible {
    case outOfStock
    
    var description: String {
        switch self {
        case .outOfStock:
            return "재고가 없습니다."
        }
    }
}
