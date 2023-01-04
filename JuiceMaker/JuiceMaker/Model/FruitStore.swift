//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

class FruitStore {
    var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10]
    
    init(strawberry: Int, banana: Int, kiwi: Int, mango: Int, pineapple: Int) {
        self.fruits[.strawberry] = strawberry
        self.fruits[.banana] = banana
        self.fruits[.kiwi] = kiwi
        self.fruits[.mango] = mango
        self.fruits[.pineapple] = pineapple
    }
    
    convenience init(amount: Int) {
        self.init(strawberry: amount, banana: amount, kiwi: amount, mango: amount, pineapple: amount)
    }
    
    func increaseFruit(_ fruit: Fruit, by amount: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit + amount
    }
    
    func decreaseFruit(_ fruit: Fruit, by amount: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit - amount
    }
    
    func checkFruit(_ fruit: Fruit, by amount: Int) throws {
        guard let storedFruit = self.fruits[fruit] else {
            throw FruitStoreError.noExistInventory
        }
        guard storedFruit >= amount else {
            throw FruitStoreError.lackedInventory(fruit: fruit, lackedAmount: amount - storedFruit)
        }
    }
}
