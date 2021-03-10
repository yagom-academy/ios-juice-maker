//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class JuiceMaker {
    
    let fruitStorage = FruitStock.shared
    
    func makeJuice(juice: Juices) {
        for (whatFruit, needFruitsForJuice) in juice.juiceRecipe {
            do {
                try chcekFruitStock(fruit: whatFruit, amount: needFruitsForJuice)
                consumeFruit(fruit: whatFruit, amount: needFruitsForJuice)
            } catch {
                // 알럿 처리 부분
            }
        }
    }
    
    func consumeFruit(fruit whatFruit: Fruits, amount needFruitsForJuice: Int) {
        do {
            try fruitStorage.fruitManager(fruit: whatFruit, amount: -needFruitsForJuice)
        } catch {
            return
        }
    }
    
    func addFruitStock(fruit whatFruit: Fruits, amount addFruits: Int = 1) {
        do {
            try fruitStorage.fruitManager(fruit: whatFruit, amount: addFruits)
        } catch {
            return
        }
    }
    
    func chcekFruitStock(fruit whatFruit: Fruits, amount needFruitsForJuice: Int) throws {
        guard let stock = fruitStorage.fruits[whatFruit], needFruitsForJuice > 0, stock - needFruitsForJuice >= 0 else {
            throw StockError.lackStock
        }
    }
    
    func currentFruitStock() -> Storage {
        return fruitStorage.fruits
    }
}
