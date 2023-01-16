//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

class FruitStore {
    private(set) var fruits: [Fruit: Int] = [:]

    init(amount: Int = 0) {
        self.fruits[.strawberry] = amount
        self.fruits[.banana] = amount
        self.fruits[.kiwi] = amount
        self.fruits[.mango] = amount
        self.fruits[.pineapple] = amount
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
