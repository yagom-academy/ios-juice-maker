//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kiseok, 쥬봉이. 
//  Copyright © yagom academy. All rights reserved.
// 


// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore(initialStock: 10)
    
    mutating func makeJuice(menu: JuiceMenu) {
        let recipe: [Fruit: Int] = checkRecipe(of: menu)
        
        guard fruitStore.decreaseStock(fruitsInStore: recipe) else {
            print("\(menu)를 만들 수 없습니다.")
            return
        }
        print("\(menu)를 만들었습니다.")
    }
    
    private func checkRecipe(of menu: JuiceMenu) -> [Fruit: Int] {
        var recipe: [Fruit: Int] = [:]
        
        switch menu {
        case .strawberryJuice:
            recipe = [.strawberry: 16]
        case .bananaJuice:
            recipe = [.banana: 2]
        case .pineappleJuice:
            recipe = [.pineapple: 2]
        case .kiwiJuice:
            recipe = [.kiwi: 3]
        case .mangoJuice:
            recipe = [.mango: 3]
        case .strawberryBananaJuice:
            recipe = [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            recipe = [.mango: 2, .kiwi: 1]
        }
        
        return recipe
    }
}




