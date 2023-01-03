//  JuiceMaker - JuiceMaker.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(juice: JuiceMenu) {
//        do {
//            try checkFruitInJuice(juice: juice)
//            useFruit(juice: juice)
//            print(fruitStore.fruits)
//        } catch FruitStoreError.noExistInventory {
//            print("해당 과일 존재하지 않음")
//        } catch FruitStoreError.lackedInventory {
//            print("과일 재고 부족")
//        } catch {
//            print(error)
//        }
        if checkFruitInJuice(juice: juice) {
            useFruit(juice: juice)
        }
    }
    
    func checkFruitInJuice(juice: JuiceMenu) -> Bool {
        for (fruit, num) in juice.recipe {
            do {
                try fruitStore.checkFruit(fruit: fruit, number: num)
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
    
    func useFruit(juice: JuiceMenu) {
        for (fruit, num) in juice.recipe {
            fruitStore.decreaseFruit(fruit: fruit, number: num)
        }
    }
}
