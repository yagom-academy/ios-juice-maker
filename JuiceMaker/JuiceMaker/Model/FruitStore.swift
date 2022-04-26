//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    
    private var stocks: [Fruits: Int] = [:]
    private let stock = 10
    init() {
        Fruits.allCases.forEach { stocks[$0] = stock }
    }
    
    func orderJuice(order: Juice) throws {
        for fruit in order.chooseJuiceRecipe.keys {
            try checkFruitStock(juice: order, fruits: fruit)
        }
    }

    private func checkFruitStock(juice: Juice, fruits: Fruits) throws {
        guard let stockFruit = stocks[fruits], let needFruitAmount = juice.chooseJuiceRecipe[fruits], stockFruit >= needFruitAmount else {
            throw StockError.outOfError
        }
        makeJuice(juice: juice, fruits: fruits)
    }
    
    private func makeJuice(juice: Juice, fruits: Fruits) {
        if let stockFruit = stocks[fruits], let requiredFruite = juice.chooseJuiceRecipe[fruits] {
            stocks.updateValue(stockFruit - requiredFruite, forKey: fruits)
        }
    }
}

