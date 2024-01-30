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
//        if try fruitStore.isAvailable(menu: juiceMenu) {
//            fruitStore.consumeStock(recipe: juiceMenu)
//        }
        
//        do {
//            try fruitStore.isAvailable(menu: juiceMenu)
//            fruitStore.consumeStock(recipe: juiceMenu)
//        } catch FruitStoreError.outOfStock {
//            print("과일의 재고가 부족합니다.")
//        } catch {
//            print("일반적이지 않은 에러입니다.")
//        }
        
        try fruitStore.isAvailable(menu: juiceMenu)
    }
}
