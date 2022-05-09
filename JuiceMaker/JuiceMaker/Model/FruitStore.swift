//
//  JuiceMaker - FruitStore.swift
//  Created by Kiwi, unchain123.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    
    static let shared = FruitStore()
    private var fruits = [Fruits:Int]()
    
    private init(){
        for fruitStock in Fruits.allCases {
            fruits[fruitStock] = 10
        }
    }
    
    func addFruitsStock(name: Fruits, quantity: Int) {
        guard let fruitsStock = fruits[name] else { return }
        fruits[name] = fruitsStock + quantity
    }
    
    func consumeFruitsStock(by fruit: [Fruits: Int]) {
        for (name, quantity) in fruit{
            guard let fruitsStock = fruits[name],fruitsStock >= quantity else { return }
            fruits[name] = fruitsStock - quantity
        }
    }
    
    func checkInventory(about fruit: [Fruits: Int]) throws {
        for (name, quantity) in fruit{
            guard let fruitsStock = fruits[name], fruitsStock >= quantity else { throw FruitStoreError.outOfStock }
        }
    }

    func showFruitsStock(name: Fruits) -> String {
        guard let fruitsStock = fruits[name] else { return " " }
        return String(fruitsStock)
    }
}
