//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    let initialStock: Int
    var fruitDictionary: [Fruit: Int]
    
    init(initialStock: Int) {
        self.initialStock = initialStock
        self.fruitDictionary = [.strawberry: initialStock, .banana: initialStock, .pineapple: initialStock, .kiwi: initialStock, .mango: initialStock]
    }
    
    func checkFruitStock() {
        for fruit in fruitDictionary {
            print("\(fruit.key)는 \(fruit.value)개 남아 있습니다.")
        }
    }
    
    func addNewFruit(newFruit: Fruit, fruitStock: Int) {
        fruitDictionary[newFruit] = fruitStock
    }
    
    func makeJuiceUseOneFruit(fruit: Fruit, requiredNumber: Int) {
        guard let stock = fruitDictionary[fruit], stock >= requiredNumber else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[fruit]!)개 입니다.")
            return
        }
        let stockAfterMakingJuice = stock - requiredNumber
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: fruit)
    }
    
    func makeStrawberryAndBananaJuice() {
        guard let strawberryStock = fruitDictionary[.strawberry], let bananaStock = fruitDictionary[.banana], strawberryStock >= 10, bananaStock >= 1 else {
            print("재고가 부족합니다. 현재 딸기 재고는 \(fruitDictionary[.strawberry]!)개 이고, 바나나 재고는 \(fruitDictionary[.banana]!)개 입니다.")
            return
        }
        let strawberryStockAfterMakingJuice = strawberryStock - 10
        let bananaStockAfterMakingJuice = bananaStock - 1
        fruitDictionary.updateValue(strawberryStockAfterMakingJuice, forKey: .strawberry)
        fruitDictionary.updateValue(bananaStockAfterMakingJuice, forKey: .banana)
    }
    
    func makeMangoAndKiwiJuice() {
        guard let mangoStock = fruitDictionary[.mango], let kiwiStock = fruitDictionary[.kiwi], mangoStock >= 2, kiwiStock >= 1 else {
            print("재고가 부족합니다. 현재 망고 재고는 \(fruitDictionary[.mango]!)개 이고, 키위 재고는 \(fruitDictionary[.kiwi]!)개 입니다.")
            return
        }
        let mangoStockAfterMakingJuice = mangoStock - 2
        let kiwiStockAfterMakingJuice = kiwiStock - 1
        fruitDictionary.updateValue(mangoStockAfterMakingJuice, forKey: .mango)
        fruitDictionary.updateValue(kiwiStockAfterMakingJuice, forKey: .kiwi)
    }
    
    func addFruitStock(fruit: Fruit) {
        guard let fruitStock = fruitDictionary[fruit] else {
            return
        }
        fruitDictionary.updateValue(fruitStock + 1, forKey: fruit)
    }
}
