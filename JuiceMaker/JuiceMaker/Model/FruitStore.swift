//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private(set) var fruitsStock: [Fruit:Int] = [:] {
        didSet {
            NotificationCenter.default.post(name: NotificationName.fruitsStockDidChanged, object: nil, userInfo: fruitsStock)
        }
    }
    let initialAmount: Int
    
    init(initialAmount: Int) {
        self.initialAmount = initialAmount
        fruitsStock = [
            .strawberry: initialAmount,
            .banana: initialAmount,
            .kiwi: initialAmount,
            .pineapple: initialAmount,
            .mango: initialAmount
        ]
    }
    
    private func bindingStock(of fruit: Fruit) throws -> Int {
        guard let stock = fruitsStock[fruit] else {
            throw JuiceMakerError.productionImpossibleError
        }
        return stock
    }
    
    private func canUseStock(of fruit: Fruit, by amount :Int) throws -> Bool {
        let stock = try bindingStock(of: fruit)
        guard stock >= amount else {
            return false
        }
        return true
    }
    
    private func useOfStock(for fruitJuice: FruitJuice) throws -> FruitJuice? {
        for (fruit, amount) in fruitJuice.getRecipe() {
            let stock = try bindingStock(of: fruit)
            fruitsStock[fruit] = stock - amount
        }
        return fruitJuice
    }
    
    func make(_ fruitJuice: FruitJuice) throws -> FruitJuice? {
        var canComplete = true
        for (fruit, amount) in fruitJuice.getRecipe() {
            canComplete = try canUseStock(of: fruit, by: amount) && canComplete
        }
        return canComplete ? try useOfStock(for: fruitJuice) : nil
    }
}

