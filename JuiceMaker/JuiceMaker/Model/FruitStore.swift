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
    
    func reduceFruitQuantity(fruitJuice: FruitJuice) -> Bool {
        for (fruit, quantity) in fruitJuice.juiceRecipe {
            guard let number = fruitQuantity[fruit], checkQuantity(number: number, quantity: quantity) else { return false }
            fruitQuantity[fruit] = number - quantity
        }
        return true
    }
    
    private func checkQuantity(number: Int, quantity: Int) -> Bool {
        if number - quantity >= 0 {
            return true
        } else {
            return false
        }
    }
    
    func changeFruitQuantity(of quantity: Int, fruit: Fruit) {
        fruitQuantity.updateValue(quantity, forKey: fruit)
    }
}
