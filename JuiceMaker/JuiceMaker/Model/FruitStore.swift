//
//  JuiceMaker - FruitStore.swift
//  Created by Kiwi, unchain123.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    
    static let shared = FruitStore()
    var fruits = [Fruit:Int]()
    
    private init(){
        for fruitStock in Fruit.allCases {
            fruits[fruitStock] = 10
        }
    }
    
    func consumeFruitsStock(by fruit: [Fruit: Int]) {
        for (name, quantity) in fruit{
            guard let fruitsStock = fruits[name],fruitsStock >= quantity else { return }
            fruits[name] = fruitsStock - quantity
        }
    }
    
    func checkInventory(about fruit: [Fruit: Int]) throws {
        for (name, quantity) in fruit{
            guard let fruitsStock = fruits[name], fruitsStock >= quantity else { throw FruitStoreError.outOfStock }
        }
    }

    func showFruitsStock(name: Fruit) -> Int {
        guard let fruitsStock = fruits[name] else { return -1 }
        return fruitsStock
    }
    
    func changeStock(fruit: Fruit, newValue: Int) {
        fruits[fruit] = newValue
    }
}
