//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// Todo 과일 늘리고 줄이고,
struct FruitStore {
    enum Fruit {
        case strawberry, banana, pineapple, mango, kiwi
    }
    
    enum Juice {
        case strawberryJuice, bananaJuice, pineappleJuice
        case mangoJuice, kiwiJuice, strawNanaJuice, mangKiJuice
    }
    
    var fruitInventory: [Fruit: Int]
    
    init(fruitInventory: [Fruit : Int]) {
        self.fruitInventory = fruitInventory
    }
    
    mutating func increaseFruitStock(_ fruit: Fruit, amount: Int) {
        if let currentAmount = fruitInventory[fruit] {
            fruitInventory[fruit] = currentAmount + amount
        } else {
            //오류처리
        }
    }
    
    mutating func decreaseFruitStock(_ fruit: Fruit, amount: Int) {
        if let currentAmount = fruitInventory[fruit] {
            fruitInventory[fruit] = currentAmount - amount
        } else {
            //오류처리
        }
    }
}
