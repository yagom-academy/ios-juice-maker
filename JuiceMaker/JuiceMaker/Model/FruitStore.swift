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
    
    func reduceFruitQuantity(fruitJuice: FruitJuice) throws {
        var duplicationQuantity = fruitQuantity
        
        try fruitJuice.juiceRecipe.forEach { (fruit, quantity) in
            guard let number = duplicationQuantity[fruit], number >= quantity else {
                throw JuiceMakerError.outOfStock
            }
            
            duplicationQuantity[fruit] = number - quantity
        }
        fruitQuantity = duplicationQuantity
    }
    
    func changeFruitQuantity(of quantity: Int, fruit: Fruit) {
        fruitQuantity.updateValue(quantity, forKey: fruit)
    }
}
