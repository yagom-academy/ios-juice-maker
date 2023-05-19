//
//  FruitStoreError.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/08.
//

enum FruitStoreError: Error {
    case outOfStock
    
    
    var localized: String {
        switch self {
        case .outOfStock:
            return "재고가 부족합니다."
        }
    }
}
