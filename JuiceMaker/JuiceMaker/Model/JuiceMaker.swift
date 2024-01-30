//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

enum JuiceMenu {
    case recipe(FruitCategory, Int)
}

struct MenuList {
    var strawberryJuice: [JuiceMenu]
    var bananaJuice: [JuiceMenu]
    var pineappleJuice: [JuiceMenu]
    var kiwiJuice: [JuiceMenu]
    var mangoJuice: [JuiceMenu]
    var strawberryBananaJuice: [JuiceMenu]
    var mangoKiwiJuice: [JuiceMenu]
}

class JuiceMaker {
    var fruitStore: FruitStore
    
    init() {
        self.fruitStore = FruitStore(fruits: [.strawberry: 10,
                                             .banana: 10,
                                             .pineapple: 10,
                                             .kiwi: 10,
                                             .mango: 10])
    }
    
    func makeJuice(juiceMenu: [JuiceMenu]) throws {
        try fruitStore.isAvailable(menu: juiceMenu)
    }
}
