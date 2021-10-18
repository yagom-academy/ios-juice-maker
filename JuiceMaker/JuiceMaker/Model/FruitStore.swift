//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Fruit {
    var name: FruitName
    var count: Int = 10
    
    enum FruitName {
        case 딸기 // rawValue String?
        case 바나나
        case 파인애플
        case 키위
        case 망고
    }
}

// 과일 저장소 타입
class FruitStore {
    
    enum FruitStoreError: String, LocalizedError {
        case inValidFruitChoice = "유효하지 않은 선택입니다."
        case lackOfStock = "재료가 부족합니다."
        
        var description: String {
            return rawValue
        }
    }

    var inventory: [Fruit] = [
        Fruit(name: .딸기),
        Fruit(name: .바나나),
        Fruit(name: .파인애플),
        Fruit(name: .키위),
        Fruit(name: .망고)
    ]
    
    func findIndexFromInventory(with fruit: Fruit.FruitName) throws -> Int {
        guard let indexOfFruit = inventory.firstIndex(where: { $0.name == fruit }) else {
            throw FruitStoreError.inValidFruitChoice
        }
        return indexOfFruit
    }
    
    func addInventory(count: Int, to fruit: Fruit.FruitName) {
        do {
            let indexOfFruit = try findIndexFromInventory(with: fruit)
            inventory[indexOfFruit].count += count
        } catch FruitStoreError.inValidFruitChoice {
            print(FruitStoreError.inValidFruitChoice.description)
        } catch {
            print(error)
        }
    }
    
    func checkEnoughStock(from index: Int, for count: Int) throws {
        guard inventory[index].count > count else {
            throw FruitStoreError.lackOfStock
        }
    }
    
    func subtractStock(count: Int, from fruit: Fruit.FruitName) {
         do {
             let indexOfFruit = try findIndexFromInventory(with: fruit)
             try checkEnoughStock(from: indexOfFruit, for: count)
             inventory[indexOfFruit].count -= count
         } catch FruitStoreError.inValidFruitChoice {
             print(FruitStoreError.inValidFruitChoice.description)
         } catch FruitStoreError.lackOfStock {
             print(FruitStoreError.lackOfStock.description)
         } catch {
             print(error)
         }
     }
}
