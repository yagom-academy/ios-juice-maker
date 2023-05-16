//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//  last modified by maxhyunm, kobe
//

typealias Ingredient = (fruit: Fruit, quantity: Int)
typealias Recipe = [Ingredient]

struct JuiceMaker {
	private var fruitStore: FruitStore
	
    init(stock: [Fruit: Int]) {
        self.fruitStore = FruitStore(stock: stock)
    }
    
	init(equalizedStock: Int) {
		self.fruitStore = FruitStore(equalizedStock: equalizedStock)
	}
	
	func makeFruitJuice(menu: FruitJuice) throws {
		let recipe = menu.juiceRecipe
        var changedStock: Recipe = []
        for ingredient in recipe {
            let changedQuantity = try fruitStore.calculateStock(of: ingredient.fruit,
                                                                quantity: ingredient.quantity)
            changedStock.append((fruit: ingredient.fruit, quantity: changedQuantity))
        }
        changedStock.forEach {
            fruitStore.changeStock(of: $0.fruit, quantity: $0.quantity)
        }
        print("\(menu.name) 제조가 완료되었습니다.")
	}
    
    func changeFruitStock(of fruit: Fruit, quantity: Int) {
        fruitStore.changeStock(of: fruit, quantity: quantity)
    }
    
    func getFruitInventoryStatus() -> [Fruit: Int] {
        return fruitStore.getInventoryStatus()
    }
}
