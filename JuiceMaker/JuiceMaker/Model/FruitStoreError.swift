//  JuiceMaker - FruitStoreError.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

import Foundation

enum FruitStoreError: Error, LocalizedError {
    case lackedInventory(fruit: Fruit, lackedAmount: Int)
    case noExistInventory
    
    var errorDescription: String? {
        switch self {
        case .lackedInventory(let fruit, let amount):
            return "\(fruit) 과일 \(amount)개 부족"
        case .noExistInventory:
            return "과일 존재하지 않음"
        }
    }
}
