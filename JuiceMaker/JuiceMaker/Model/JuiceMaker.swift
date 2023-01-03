//  JuiceMaker - JuiceMaker.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        if checkFruitInStore(juice) {
            useFruit(juice)
        }
    }
    
    private func checkFruitInStore(_ juice: Juice) -> Bool {
        for (fruit, num) in juice.recipe {
            do {
                try fruitStore.check(fruit: fruit, by: num)
            } catch FruitStoreError.noExistInventory {
                print("해당 과일 존재하지 않음")
                return false
            } catch FruitStoreError.lackedInventory {
                print("과일 재고 부족")
                return false
            } catch {
                print(error)
                return false
            }
        }
        return true
    }
    
    private func useFruit(_ juice: Juice) {
        for (fruit, num) in juice.recipe {
            fruitStore.decrease(fruit: fruit, by: num)
        }
    }
}
