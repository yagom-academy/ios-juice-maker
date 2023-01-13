//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

class FruitStore {
    private var fruits: [Fruit: Int] = [.strawberry: 0, .banana: 0, .kiwi: 0, .mango: 0, .pineapple: 0]

    init(amount: Int) {
        self.fruits[.strawberry] = amount
        self.fruits[.banana] = amount
        self.fruits[.kiwi] = amount
        self.fruits[.mango] = amount
        self.fruits[.pineapple] = amount
    }
    
    func getFruits() -> [Fruit: Int] {
        return fruits
    }
    
    func setFruits(_ fruits: [Fruit: Int]) {
        self.fruits = fruits
    }
    
    func increaseFruit(_ fruit: Fruit, by amount: Int = 1) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit + amount
    }
    
    func decreaseFruit(_ fruit: Fruit, by amount: Int = 1) {
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
