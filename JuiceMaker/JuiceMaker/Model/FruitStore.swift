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
        for fruit in order.chooseJuice.keys {
            try checkFruitStock(juice: order, fruits: fruit)
        }
    }

    private func checkFruitStock(juice: Juice, fruits: Fruits) throws {
        guard let stockFruit = stocks[fruits] ,let needFruitAmount = juice.chooseJuice[fruits], stockFruit >= needFruitAmount else {
            throw StockError.outOfError
        }
        minusStock(juice: juice, fruits: fruits)
    }
    private func minusStock(juice: Juice, fruits: Fruits) {
        if let stockFruit = stocks[fruits] ,let needFruit = juice.chooseJuice[fruits] {
            stocks.updateValue(stockFruit - needFruit, forKey: fruits)
        }
    }
}

