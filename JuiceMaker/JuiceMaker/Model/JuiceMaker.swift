//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Ingredient = (fruit: Fruit, quantity: Int)
typealias Recipe = [Ingredient]

// 쥬스 메이커 타입
struct JuiceMaker {

	private var fruitStore: FruitStore
	
	init(fruitStore: FruitStore) {
		self.fruitStore = fruitStore
	}
	
	mutating func makeFruitJuice(menu: FruitJuice) {
		let recipes = menu.juiceRecipe
        var chagedStock: Recipe = []
        do {
            for recipe in recipes {
                let changedQuantity = try fruitStore.calculateStock(of: recipe.fruit, quantity: recipe.quantity)
                chagedStock.append((fruit: recipe.fruit, quantity: changedQuantity))
            }
            chagedStock.forEach { fruitStore.changeStock(of: $0.fruit, quantity: $0.quantity) }
			print("\(menu.name) 제조가 완료되었습니다.")
        } catch StockError.fruitNotFound {
            print(StockError.fruitNotFound.message)
        } catch StockError.outOfStock {
            print(StockError.outOfStock.message)
        } catch {
            print(StockError.unKnown.message)
        }
	}
}
