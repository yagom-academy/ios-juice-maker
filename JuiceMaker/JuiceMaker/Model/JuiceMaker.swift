//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var recipe: Dictionary<Juice,Dictionary<Fruit,Int>>
    var fruitStore: FruitStore
    
    init(recipe: Dictionary<Juice,Dictionary<Fruit,Int>>, fruitStore: FruitStore) {
        self.recipe = recipe
        self.fruitStore = fruitStore
    }
    
    func getAJuiceRecipe(juice: Juice) throws -> Dictionary<Fruit,Int> {
        guard let juiceRecipe = self.recipe[juice] else {
            throw JuiceMakingError.noRecipe
        }
        return juiceRecipe
    }
    
    func make(juice: Juice) -> Juice? {
        do {
            let juiceRecipe = try getAJuiceRecipe(juice: juice)
            for (fruit,amount) in juiceRecipe {
                try self.fruitStore.checkStock(fruit: fruit, amount: amount)
            }
            for (fruit,amount) in juiceRecipe {
                try self.fruitStore.useFruit(fruit: fruit, amount: amount)
            }
            return juice
        } catch JuiceMakingError.notEnoughStock {
            print("재고가 부족합니다.")
            return nil
        } catch JuiceMakingError.notRegisteredFruit {
            print("존재하지 않는 과일입니다.")
            return nil
        }
        catch {
            print("알 수 없는 에러가 났습니다.")
            return nil
        }
    }
}
