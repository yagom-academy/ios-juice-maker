//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Recipe = [Ingredient]
typealias Ingredient = (fruit: Fruit, amount: Int)

protocol FruitStoreDelegate: NSObject {
    func onChangeStock()
}

class FruitStore {
    
    weak var delegate: FruitStoreDelegate?
    
    var fruitStock: [Fruit: Int] {
        didSet {
            delegate?.onChangeStock()
        }
    }
    
    init(fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .mango: 10,
        .kiwi: 10,
        .pineapple: 10
    ]) {
        self.fruitStock = fruitStock
    }
    
    func useValidStock(juiceRecipe: Recipe) throws {
        try juiceRecipe.forEach { try validateStock(ingredient: $0) }
        juiceRecipe.forEach { spendStock(of: $0.fruit, by: $0.amount)}
    }
    
    private func validateStock(ingredient: Ingredient) throws {
        let currentStock = getStock(fruit: ingredient.fruit)
        
        guard currentStock >= ingredient.amount else {
            throw FruitStoreError.notEnoughStock(ingredient.fruit)
        }
    }
    
    private func spendStock(of fruit: Fruit, by amount: Int) {
        self.fruitStock[fruit] = getStock(fruit: fruit) - amount
    }
    
    func updateStock(of fruit: Fruit, by amount: Int) {
        self.fruitStock.updateValue(amount, forKey: fruit)
    }
    
    func getStock(fruit: Fruit) -> Int {
        guard let stock = self.fruitStock[fruit] else { return 0 }
        return stock
    }
}
