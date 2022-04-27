//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private var store = FruitStore()
    
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
    
    private func checkRecipe(of juice: Menu) -> [FruitStore.Fruit: Int] {
        switch juice {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 10, .kiwi: 1]
        }
    }
    
    func make(juice: Menu, at store: FruitStore) {
        do {
            let recipe = checkRecipe(of: juice)
            let isPossible = try store.hasEnoughInventory(of: recipe, in: store.fruitsInventory)
        
            if isPossible {
                try store.reduceInventory(of: recipe)
                print("\(juice)를 만들었어요! 😁")
            }
        } catch {
            print(AppError.lackOfInventory.message)
        }
    }
}
