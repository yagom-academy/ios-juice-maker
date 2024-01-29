//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum JuiceMenu {
    case recipe(FruitCategory, Int)
}

enum MenuList {
    static var strawberryJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.strawberry, 16)]
    }
    
    static var bananaJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.banana, 3)]
    }
    
    static var pineappleJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.pineapple, 2)]
    }
    
    static var kiwiJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.kiwi, 3)]
    }
    
    static var mangoJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.mango, 3)]
    }
    
    static var strawberryBananaJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.strawberry, 10), JuiceMenu.recipe(.banana, 1)]
    }
    
    static var mangoKiwiJuice: [JuiceMenu] {
        return [JuiceMenu.recipe(.mango, 2), JuiceMenu.recipe(.kiwi, 1)]
    }
}

class JuiceMaker {
    var fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore(fruit: [.strawberry: 10,
                                             .banana: 10,
                                             .pineapple: 10,
                                             .kiwi: 10,
                                             .mango: 10])
    }
    
    func makeJuice(juiceMenu: [JuiceMenu]) {
        if fruitStore.checkSufficientStock(recipe: juiceMenu) {
            fruitStore.consumeStock(recipe: juiceMenu)
        }
    }
}
