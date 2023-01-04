//  JuiceMaker - JuiceMaker.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

struct JuiceMaker {
    private let fruitStore = FruitStore(amount: 10)
    
    func makeJuice(_ juice: Juice) {
        if checkFruitInStore(juice) {
            useFruit(in: juice)
        }
    }
    
    private func checkFruitInStore(_ juice: Juice) -> Bool {
        for (fruit, num) in juice.recipe {
            do {
                try fruitStore.checkFruit(fruit, by: num)
            } catch let error as FruitStoreError {
                if let message = error.errorDescription {
                    print(message)
                }
                return false
            } catch {
                print(error)
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
