//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import RxSwift

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
    
    typealias FruitsInventory = [FruitType: Int]
    
    private(set) var inventory = FruitsInventory()
    
    private lazy var inventorySubject = BehaviorSubject<FruitsInventory>(value: inventory)
    var inventoryObservable: Observable<FruitsInventory> {
        inventorySubject.asObserver()
    }
    
    init(initialFruitCount: Int = 10) {
        FruitType.allCases.forEach { fruit in
            inventory[fruit] = initialFruitCount
        }
    }
    
    func use(of fruitsInventory: FruitsInventory) -> Result<Void, FruitStoreError> {
        let checkedInventory =  checkInventory(of: fruitsInventory)
        switch checkedInventory {
        case .success():
            inventory = calculateUsableInventory(toSubtract: fruitsInventory)
            inventorySubject.onNext(inventory)
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
        
        inventorySubject.onNext(inventory)
    }
    
    private func checkInventory(of fruitsInventory: FruitsInventory) -> Result<Void, FruitStoreError> {
        let negativeFruitTypes = calculateUsableInventory(toSubtract: fruitsInventory)
            .filter { $0.value < 0 }
        guard negativeFruitTypes.count < 1 else {
            return .failure(.notEnoughFruits)
        }
        return .success(Void())
    }
    
    private func calculateUsableInventory(toSubtract fruitsInventory: FruitsInventory) -> FruitsInventory {
        return inventory.merging(fruitsInventory, uniquingKeysWith: {
            $0 - $1
        })
    }
}
