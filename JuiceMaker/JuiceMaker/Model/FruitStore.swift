//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum FruitStoreError: Error {
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
    private var inventory = [FruitType: Int]()
    
    init(initialFruitCount: Int = 10) {
        FruitType.allCases.forEach { fruit in
            inventory[fruit] = initialFruitCount
        }
    }
    
    func updateInventory(of fruits: [FruitType: Int]) -> Result<Void, Error> {
        let result = checkInventory(of: fruits)
        
        switch result {
        case .success():
            return .success(Void())
        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func checkInventory(of fruits: [FruitType: Int]) -> Result<Void, FruitStoreError> {
        let result = inventory
            .merging(fruits, uniquingKeysWith: {
                $0 + $1
            })
            .filter { $0.value < 0 }
        
        guard result.count < 0 else {
            return .failure(.notEnoughFruits)
        }
        
        return .success(Void())
    }
}
