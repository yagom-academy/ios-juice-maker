//  JuiceMaker - FruitStore.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

// 과일 저장소 타입
class FruitStore {
    var fruits: [Fruit: Int] = [.strawberry: 10, .banana: 10, .kiwi: 10, .mango: 10, .pineapple: 10]
    
    func increaseFruit(fruit: Fruit, number: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit + number
    }
    
    func decreaseFruit(fruit: Fruit, number: Int) {
        guard let storedFruit = self.fruits[fruit] else {
            return
        }
        self.fruits[fruit] = storedFruit - number
    }
    
    func checkFruit(fruit: Fruit, number: Int) throws {
        guard let storedFruit = self.fruits[fruit] else {
            throw FruitStoreError.noExistInventory
        }
        guard storedFruit >= number else {
            throw FruitStoreError.lackedInventory
        }
    }
}
