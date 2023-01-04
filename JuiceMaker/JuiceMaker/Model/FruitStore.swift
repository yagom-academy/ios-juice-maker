//
//  JuiceMaker - FruitStore.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    private var stock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    private func addStock(fruit: Fruit, amount: Int) {
        guard let currentStock = stock[fruit] else {
            return
        }
        stock[fruit] = currentStock + amount
    }
    
    func subtractStock(fruit: Fruit, amount: Int) throws {
        guard let currentStock = stock[fruit] else {
            return
        }
        
        guard currentStock >= amount else {
            throw JuiceMakerError.insufficientStock
        }
        stock[fruit] = currentStock - amount
    }
}
