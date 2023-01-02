//
//  JuiceMaker - FruitStore.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var stock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .mango: 10]
    
    func addFruitStock(fruit: Fruit, amount: Int) {
        guard let currentStock = stock[fruit] else {
            return
        }
        stock[fruit] = currentStock + amount
    }
    
    func subtractFruitStock(fruit: Fruit, amount: Int) throws {
        guard let currentStock = stock[fruit] else {
            return
        }
        
        guard currentStock >= amount else {
            throw JuiceMakerError.insufficientStock
        }
        
        stock[fruit] = currentStock - amount
    }
}
