//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

typealias Recipe = (fruit: Fruit, quantity: Int)

// 쥬스 메이커 타입
struct JuiceMaker {

	var fruitStore: FruitStore
	
	init(fruitStore: FruitStore) {
		self.fruitStore = fruitStore
	}
	
	func makeFruitJuice(menu: FruitJuice) {
		let recipes = menu.juiceRecipe
        var chagedStock: Array<Recipe> = []
        do {
            for recipe in recipes {
                let changedQuantity = try fruitStore.calculateStock(for: recipe.fruit, quantity: recipe.quantity)
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
