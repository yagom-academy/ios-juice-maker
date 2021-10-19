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
        case strawberry // rawValue String?
        case banana
        case pineapple
        case kiwi
        case mango
    }
}

// 과일 저장소 타입
class FruitStore {
    
    enum FruitStoreError: LocalizedError {
        case inValidFruitChoice
        case lackOfStock(stockNeeded: Int)
        
        var description: String {
            switch self {
            case .inValidFruitChoice:
                return "유효하지 않은 선택입니다."
            case .lackOfStock(let stockNeeded):
                return "재료가 \(stockNeeded)개 부족합니다. 재고를 확인해주세요."
            }
        }
    }

    var inventory: [Fruit] = [
        Fruit(name: .strawberry),
        Fruit(name: .banana),
        Fruit(name: .pineapple),
        Fruit(name: .kiwi),
        Fruit(name: .mango)
    ]
    
    func findIndexFromInventory(with fruit: Fruit.FruitName) throws -> Int {
        guard let indexOfFruit = inventory.firstIndex(where: { $0.name == fruit }) else {
            throw FruitStoreError.inValidFruitChoice
        }
        return indexOfFruit
    }
    
    func addStock(count: Int, to fruit: Fruit.FruitName) {
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
        guard inventory[index].count >= count else {
            throw FruitStoreError.lackOfStock(stockNeeded: count - inventory[index].count)
        }
    }
    
    func subtractStock(count: Int, from fruit: Fruit.FruitName) {
         do {
             let indexOfFruit = try findIndexFromInventory(with: fruit)
             try checkEnoughStock(from: indexOfFruit, for: count)
             inventory[indexOfFruit].count -= count
         } catch FruitStoreError.inValidFruitChoice {
             print(FruitStoreError.inValidFruitChoice.description)
         } catch FruitStoreError.lackOfStock(let count) {
             print(FruitStoreError.lackOfStock(stockNeeded: count).description)
         } catch {
             print(error)
         }
     }
}
