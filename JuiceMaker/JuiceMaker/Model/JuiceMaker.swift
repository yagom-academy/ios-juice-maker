//
//  JuiceMaker - JuiceMaker.swift
//  Created by Ash, 미니.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> Bool {
        do {
            try fruitStore.haveStock(for: juice)
            return true
        } catch StoreError.outOfStock {
            return false
        } catch {
            return false
        }
    }
    
    func readStock(_ fruit: Fruit) -> Int? {
        return fruitStore.sendStock(to: fruit)
    }
    
    func updateStock(_ fruit: Fruit, _ stock: Int) {
        fruitStore.updateInventory(fruit, stock)
    }
}
