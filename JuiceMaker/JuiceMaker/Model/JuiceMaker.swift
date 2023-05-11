//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice) {
        do {
            try fruitStore.useValidStock(juiceRecipes: juice.recipe)
        } catch FruitStoreError.notFoundFruit(let fruit) {
            print("\(fruit.name)을/를 찾을 수 없습니다.")
        } catch FruitStoreError.notEnoughStock(let fruit) {
            print("\(fruit.name) 재고가 없습니다.")
        } catch {
            print("알 수 없는 에러")
        }
    }
}
