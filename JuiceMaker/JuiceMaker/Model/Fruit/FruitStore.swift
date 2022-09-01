//  Created by 애종,질리,벨라 on 2022/08/30.

class FruitStore {
    private var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango:10
    ]
    
    private func getStock(fruit: Fruit) -> Int? {
        if let fruitStock = fruitStock[fruit] {
            return fruitStock
        } else {
            return nil
        }
    }
    
    private func updateStock(_ fruit: Fruit, for amount: Int){
        fruitStock.updateValue(amount, forKey: fruit)
    }
}

extension FruitStore: FruitStoreProtocol {
    func updateFruitStock(fruit: Fruit, variation: Variation) {
        guard let targetStock = fruitStock[fruit] else { return }
    
        if variation == .increase {
            updateStock(fruit, for: targetStock + 1)
        } else if variation == .decrease && targetStock >= 0 {
            updateStock(fruit, for: targetStock - 1)
        } else {
            debugPrint("재고변경에 실패하였습니다.")
        }
    }
    
    func subtractFruitStock(fruit: Fruit, amount: Int) {
        guard let targetStock = fruitStock[fruit] else { return }
        
        updateStock(fruit, for: targetStock - amount)
    }
    
    func isEnoughStock(juiceRecipe: [Juice.Recipe]) -> Bool {
        for ingredient in juiceRecipe {
            guard let fruitStock = getStock(fruit: ingredient.name),
               fruitStock >= ingredient.amount
            else {
                return false
            }
        }
        
        return true
    }
}
