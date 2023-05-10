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
    
    private func makeJuice(juiceRecipe: JuiceRecipe...) {
        do {
            try fruitStore.useValidStock(juiceRecipes: juiceRecipe)
        } catch FruitStoreError.notFoundKey(let fruit) {
            print("\(fruit.rawValue)을/를 찾을 수 없습니다.")
        } catch FruitStoreError.notEnoughStock(let fruit) {
            print("\(fruit.rawValue) 재고가 없습니다.")
        } catch {
            print("알 수 없는 에러")
        }
    }
}
