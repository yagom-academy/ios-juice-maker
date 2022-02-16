//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitStoreError {
    case notEnoughFruits
}

extension FruitStoreError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notEnoughFruits:
            return "과일이 부족합니다."
        }
    }
}

/// 과일 저장소 타입
struct FruitStore {
    private(set) var inventory = [FruitType: Int]()
    
    init(initialFruitCount: Int = 10) {
        FruitType.allCases.forEach { fruit in
            inventory[fruit] = initialFruitCount
        }
    }
    
    mutating func use(of fruitTypes: [FruitType: Int]) -> Result<Void, FruitStoreError> {
        let checkedInventory =  checkInventory(of: fruitTypes)
        switch checkedInventory {
        case .success():
            inventory = calculateUsableInventory(toSubtract: fruitTypes)
            return .success(Void())
        case .failure(let error):
            return .failure(error)
        }
    }
    
    mutating func changeFruitCount(of fruit: FruitType, count: Int) {
        guard count > 0 else {
            return
        }
        inventory[fruit] = count
    }
    
    private func checkInventory(of fruitTypes: [FruitType: Int]) -> Result<Void, FruitStoreError> {
        let negativeFruitTypes = calculateUsableInventory(toSubtract: fruitTypes)
            .filter { $0.value < 0 }
        guard negativeFruitTypes.count < 1 else {
            return .failure(.notEnoughFruits)
        }
        return .success(Void())
    }
    
    private func calculateUsableInventory(toSubtract fruitTypes: [FruitType: Int]) -> [FruitType: Int] {
        return inventory.merging(fruitTypes, uniquingKeysWith: {
            $0 - $1
        })
    }
}
