//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var recipe: Dictionary<Juice,Dictionary<Fruit,Int>> = Juice.defaultJuiceRecipe
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func getAJuiceRecipe(juice: Juice) throws -> Dictionary<Fruit,Int> {
        guard let juiceRecipe = self.recipe[juice] else {
            throw JuiceMakingError.noRecipe
        }
        return juiceRecipe
    }
    
    func makeJuice(_ juice: Juice) -> Juice? {
        do {
            let juiceRecipe = try getAJuiceRecipe(juice: juice)
            for (fruit,amount) in juiceRecipe {
                try self.fruitStore.checkStock(fruit: fruit, amount: amount)
            }
            for (fruit,amount) in juiceRecipe {
                try self.fruitStore.consumeStock(fruit: fruit, amount: amount)
            }
            return juice
        } catch JuiceMakingError.notEnoughStock {
            print(ErrorMessage.notEnoughStock)
            return nil
        } catch JuiceMakingError.notRegisteredFruit {
            print(ErrorMessage.notRegisteredFruit)
            return nil
        } catch JuiceMakingError.noRecipe {
            print(ErrorMessage.noRecipe)
            return nil
        }
        catch {
            print(ErrorMessage.unkown)
            return nil
        }
    }
}
