//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

class FruitStore {
    private var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10]
    
    func increase(fruit: Fruit, by amount: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit + amount
    }
    
    func decrease(fruit: Fruit, by amount: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit - amount
    }
    
    func check(fruit: Fruit, by amount: Int) throws {
        guard let storedFruit = self.fruits[fruit] else {
            throw FruitStoreError.noExistInventory
        }
        guard storedFruit >= amount else {
            throw FruitStoreError.lackedInventory
        }
    }
}
