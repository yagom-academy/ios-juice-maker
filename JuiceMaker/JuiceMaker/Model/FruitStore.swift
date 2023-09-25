//
//  JuiceMaker - FruitStore.swift
//  Created by uemu, Toy. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
final class FruitStore {
    static let shared = FruitStore()
    private (set) var fruitQuantity: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    private init() {}
    
    func reduceFruitQuantity(fruitJuice: FruitJuice) {
        fruitJuice.juiceRecipe.forEach { (fruit, number) in
            guard let quantity = fruitQuantity[fruit] else { return }
            fruitQuantity[fruit] = quantity - number
        }
    }
    
    func validateJuiceMaker(fruitJuice: FruitJuice) -> Bool {
        for (fruit, number) in fruitJuice.juiceRecipe {
            guard let quantity = fruitQuantity[fruit], checkQuantity(quantity: quantity, number: number) else { return false }
        }
        return true
    }
    
    private func checkQuantity(quantity: Int, number: Int) -> Bool {
        if quantity - number >= 0 && quantity >= number {
            return true
        } else {
            return false
        }
    }
    
    func changeFruitQuantity(of quantity: String, fruit: Fruit) {
        guard let quantity = Int(quantity) else { return }
        fruitQuantity.updateValue(quantity, forKey: fruit)
    }
}
