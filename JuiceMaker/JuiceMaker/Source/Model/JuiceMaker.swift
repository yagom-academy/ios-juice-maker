// JuiceMaker.swift

import Foundation

class JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func viewFruitStock(fruitName: Fruit) -> String {
        let quantity = fruitStore.getQuantity(of: fruitName)
        return String(quantity)
    }
    
    func makeJuice(juiceMenu: JuiceMenu, amount: Int) throws -> String {
        try fruitStore.checkFruitAvailability(fruitsStock: juiceMenu.ingredients, amount: amount)
        
        if deductFruit(requestJuiceName: juiceMenu.name, requestFruits: juiceMenu.ingredients, requestJuiceAmount: amount) {
            return "\(juiceMenu.name)를 \(amount)잔 만들었습니다."
        } else {
            throw FruitResultError.outOfStockError
        }
    }
    
    private func deductFruit(requestJuiceName: String, requestFruits: [Fruit: Int], requestJuiceAmount: Int) -> Bool {
        for (fruit, requiredQuantity) in requestFruits {
            let useFruitQuantity = requiredQuantity * requestJuiceAmount
            let currentQuantity = fruitStore.getQuantity(of: fruit)
            
            if currentQuantity < useFruitQuantity {
                return false
            }
            
            let newQuantity = currentQuantity - useFruitQuantity
            fruitStore.updateStock(for: fruit, quantity: newQuantity)
        }
        return true
    }
}
