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
final class FruitStore {
    
    // MARK: - Private Properties
    
    private(set) var inventory = FruitItems()
    
    
    // MARK: - Init
    
    init(initialFruitCount: Int = 10) {
        FruitType.allCases.forEach { fruit in
            inventory[fruit] = initialFruitCount
        }
    }
    
    
    // MARK: - Internal Methods
    
    func use(of fruits: FruitItems) -> Result<Void, FruitStoreError> {
        let checkedInventory =  checkInventory(of: fruits)
        switch checkedInventory {
        case .success():
            inventory = calculateUsableInventory(toSubtract: fruits)
            return .success(Void())
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func changeFruitCount(of fruit: FruitType, count: Int) {
        guard count > 0 else {
            return
        }
        inventory[fruit] = count
    }
    
    
    // MARK: - Private Methods
    
    private func checkInventory(of fruits: FruitItems) -> Result<Void, FruitStoreError> {
        let negativeFruitTypes = calculateUsableInventory(toSubtract: fruits)
            .filter { $0.value < 0 }
        guard negativeFruitTypes.count < 1 else {
            return .failure(.notEnoughFruits)
        }
        return .success(Void())
    }
    
    private func calculateUsableInventory(toSubtract fruits: FruitItems) -> FruitItems {
        return inventory.merging(fruits, uniquingKeysWith: {
            $0 - $1
        })
    }
}
