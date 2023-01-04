//  JuiceMaker - FruitStoreError.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

import Foundation

enum FruitStoreError: Error, LocalizedError {
    case lackedInventory
    case noExistInventory
    
    var errorDescription: String? {
        switch self {
        case .lackedInventory:
            return "과일 재고 부족"
        case .noExistInventory:
            return "과일 존재하지 않음"
        }
    }
}
