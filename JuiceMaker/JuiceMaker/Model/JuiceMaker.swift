//
//  JuiceMaker - JuiceMaker.swift
//  Created by hisop, morgan on 2023/09/13.
//  Copyright © yagom academy. All rights reserved.
// 

class JuiceMaker {
    private var fruitStore = FruitStore.shared
    
    func takeOrder(order: Menu) throws {
        let recipe = fetchRecipe(menu: order)
        
        guard fruitStore.checkIngredientStock(recipe: recipe) else {
            throw OrderFail.lackIngredient
        }
        
        grindJuice(recipe: recipe)
        print("\(order.rawValue)가 제작되었습니다.")
    }
    
    private func grindJuice(recipe: [Fruit: Int]) {
        for (fruit, quantity) in recipe {
            fruitStore.reduceStock(fruit: fruit, quantity: quantity)
        }
    }
    
    private func fetchRecipe(menu: Menu) -> [Fruit: Int] {
        switch menu {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .mangoJuice:
                return [.mango: 3]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
    }
}
