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
            checkOrder(Juice.strawberryJuice.recipe)
        case .bananaJuice:
            checkOrder(Juice.bananaJuice.recipe)
        case .kiwiJuice:
            checkOrder(Juice.kiwiJuice.recipe)
        case .pineappleJuice:
            checkOrder(Juice.pineappleJuice.recipe)
        case .strawberryBananaJuice:
            checkOrder(Juice.strawberryBananaJuice.recipe)
        case .mangoJuice:
            checkOrder(Juice.mangoJuice.recipe)
        case .mangoKiwiJuice:
            checkOrder(Juice.mangoKiwiJuice.recipe)
        }
    }
    
    func checkOrder(_ recipe: [Fruit: Int]) {
        do {
            try makeJuice(by: recipe)
        } catch let error as ErrorHandling {
            print(error.description)
        } catch {
            print(error)
        }
    }
    
    func makeJuice(by recipe: [Fruit: Int]) throws {
        for (fruit, _ ) in fruitStore.fruitInventory {
            guard let fruitStock = fruitStore.fruitInventory[fruit] else {
                throw ErrorHandling.wrongFormat
            }
            guard let requiredQuantity = recipe[fruit] else {
                continue
            }
            guard fruitStock >= requiredQuantity else { throw ErrorHandling.outOfStock }
            fruitStore.fruitInventory[fruit] = fruitStock - requiredQuantity
        }
    }
}
