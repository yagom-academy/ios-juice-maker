//
//  JuiceMaker - FruitStore.swift
//  Created by uemu, Toy. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    private var fruitQuantity: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    private init() {}
    
    func reduceFruitQuantity(in fruiJuice: FruitJuice) throws {
        try fruiJuice.juiceRecipe.forEach {
            guard let number = fruitQuantity[$0] else { return }
            do {
                fruitQuantity[$0] = try checkQuantity(number: number, quantity: $1)
            } catch {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    private func checkQuantity(number: Int, quantity: Int) throws -> Int {
        if number - quantity >= 0 {
            return number - quantity
        } else {
            throw JuiceMakerError.outOfStock
        }
    }
    
    func changeFruitQuantity(of quantity: Int, fruit: Fruit) {
        fruitQuantity.updateValue(quantity, forKey: fruit)
    }
}
