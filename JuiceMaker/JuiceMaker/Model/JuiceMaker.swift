//  JuiceMaker - JuiceMaker.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(juice: JuiceMenu) {
        let recipe = juice.recipe
        
        for (fruit, num) in recipe {
            do {
                try fruitStore.checkFruit(fruit: fruit, number: num)
                fruitStore.decreaseFruit(fruit: fruit, number: num)
                print(fruitStore.fruits)
            } catch FruitStoreError.noExistInventory {
                print("해당 과일 존재하지 않음")
            } catch FruitStoreError.lackedInventory {
                print("\(fruit.name)과일 재고 부족")
            } catch {
                print(error)
            }
        }
    }
}
