//
//  JuiceMaker - FruitStore.swift
//  Created by uemu, Toy. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
final class FruitStore {
    static let shared = FruitStore()
    private var fruitQuantity: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    private init() {}
    
    func reduceFruitQuantity(in fruiJuice: FruitJuice) throws {
        try fruiJuice.juiceRecipe.forEach {(fruit, quantity) in
            guard let number = fruitQuantity[fruit] else { return }
            do {
                fruitQuantity[fruit] = try calculateQuantity(number: number, quantity: quantity)
            } catch {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    private func calculateQuantity(number: Int, quantity: Int) throws -> Int {
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
