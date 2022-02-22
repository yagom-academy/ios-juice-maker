//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func selectMenu(_ juice: Juice) {
        switch juice {
        case .strawberryJuice:
            checkOder(Juice.strawberryJuice.recipe)
        case .bananaJuice:
            checkOder(Juice.bananaJuice.recipe)
        case .kiwiJuice:
            checkOder(Juice.kiwiJuice.recipe)
        case .pineappleJuice:
            checkOder(Juice.pineappleJuice.recipe)
        case .strawberryBananaJuice:
            checkOder(Juice.strawberryBananaJuice.recipe)
        case .mangoJuice:
            checkOder(Juice.mangoJuice.recipe)
        case .mangoKiwiJuice:
            checkOder(Juice.mangoKiwiJuice.recipe)
        }
    }
    
    func checkOder(_ recipe: [Fruit: Int]) {
        do {
            try makeJuice(by: recipe)
        } catch let error as ErrorHandling {
            print(error.description)
        } catch {
            print(error)
        }
    }
    
    func makeJuice(by recipe: [Fruit: Int]) throws {
        for (fruit, _ ) in FruitStore.fruitInventory {
            guard let fruitStock = FruitStore.fruitInventory[fruit] else {
                throw ErrorHandling.wrongFormat
            }
            guard let requiredQuantity = recipe[fruit] else {
                continue
            }
            guard fruitStock >= requiredQuantity else { throw ErrorHandling.outOfStock }
            FruitStore.fruitInventory[fruit] = fruitStock - requiredQuantity
        }
    }
}
