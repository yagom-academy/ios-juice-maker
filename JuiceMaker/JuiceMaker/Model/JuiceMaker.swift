//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    var store = FruitStore()
    
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
    
    func checkRecipe(of juice: Menu) -> [FruitStore.Fruit: Int] {
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
        var isPossible = false
        do {
            isPossible = try store.isPossibleToMake(of: checkRecipe(of: juice), in: store.fruitsStock)
        } catch {
            print(AppError.lackOfStock.message)
        }
        
        if isPossible {
            store.reduce(ingredient: checkRecipe(of: juice))
            print("\(juice)를 만들었어요! 😁")
        }
    }
}
