//  JuiceMaker - JuiceMaker.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(_ juice: Juice) -> Bool {
        if checkFruitInStore(juice) {
            useFruit(in: juice)
            return true
        } else {
            return false
        }
    }
    
    private func checkFruitInStore(_ juice: Juice) -> Bool {
        for (fruit, num) in juice.recipe {
            do {
                try fruitStore.checkFruit(fruit, by: num)
            } catch {
                print(error.localizedDescription)
                return false
            }
        }
        return true
    }
    
    private func useFruit(in juice: Juice) {
        for (fruit, num) in juice.recipe {
            fruitStore.decreaseFruit(fruit, by: num)
        }
    }
}
