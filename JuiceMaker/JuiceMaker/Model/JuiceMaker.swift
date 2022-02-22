//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct Juice {
    enum Menu {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
    static func recipe(menu: Menu) -> JuiceMakerOption.Recipe {
        switch menu {
        case .strawberry:
            return JuiceMakerOption.strawberryJuiceRecipe
        case .banana:
            return JuiceMakerOption.bananaJuiceRecipe
        case .kiwi:
            return JuiceMakerOption.kiwiJuiceRecipe
        case .pineapple:
            return JuiceMakerOption.pineappleJuiceRecipe
        case .strawberryBanana:
            return JuiceMakerOption.strawberryBananaJuiceRecipe
        case .mango:
            return JuiceMakerOption.mangoJuiceRecipe
        case .mangoKiwi:
            return JuiceMakerOption.mangoKiwiJuiceRecipe
        }
    }
}

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func takeOrder() {
        let menu = Juice.Menu.banana
        
        do {
            try produceJuice(menu: menu)
        } catch JuiceMakerError.notFoundFruit {
            
        } catch {
            print(error)
        }
    }
    
    private func produceJuice(menu: Juice.Menu) throws {
        let order = Juice.recipe(menu: menu)
        
        try order.forEach {
            try fruitStore.consume(fruit: $0, amount: $1)
        }
    }
}
