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
	
	init(fruitStore: FruitStore) {
		self.fruitStore = fruitStore
	}
	
	mutating func makeFruitJuice(menu: FruitJuice) throws {
		let recipe = menu.juiceRecipe
        var changedStock: Recipe = []
        do {
            for ingredient in recipe {
                let changedQuantity = try fruitStore.calculateStock(of: ingredient.fruit,
                                                                    quantity: ingredient.quantity)
                changedStock.append((fruit: ingredient.fruit, quantity: changedQuantity))
            }
            changedStock.forEach {
                fruitStore.changeStock(of: $0.fruit, quantity: $0.quantity)
            }
			print("\(menu.name) 제조가 완료되었습니다.")
        } catch StockError.fruitNotFound {
            print(StockError.fruitNotFound.message)
			throw StockError.fruitNotFound
        } catch StockError.outOfStock {
            print(StockError.outOfStock.message)
			throw StockError.outOfStock
        } catch {
            print(StockError.unKnown.message)
			throw StockError.unKnown
        }
	}
}
