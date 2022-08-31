//  Created by 애종,질리,벨라 on 2022/08/30.

class FruitStore {
    private var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .kiwi: 10,
        .pineapple: 10,
        .mango:10
    ]
    
    private func updateStock(_ fruit: Fruit, for amount: Int){
        fruitStock.updateValue(amount, forKey: fruit)
    }
}

extension FruitStore: FruitStoreProtocol {
    func updateFruitStock(fruit: Fruit, plusOrMinus: String) {
        guard let targetStock = fruitStock[fruit] else { return }
    
        if plusOrMinus == "+" {
            updateStock(fruit, for: targetStock + 1)
        } else if plusOrMinus == "-" && targetStock >= 0 {
            updateStock(fruit, for: targetStock - 1)
        } else {
            debugPrint("재고변경에 실패하였습니다.")
        }
    }
    
    func subtractFruitStock(fruit: Fruit, amount: Int) {
        guard let targetStock = fruitStock[fruit] else { return }
        
        updateStock(fruit, for: targetStock - amount)
    }
    
    func isEnoughStock(juiceRecipe: (Fruit, Int)) -> Bool {
        guard let fruitStock = fruitStock[juiceRecipe.0],
              fruitStock >= juiceRecipe.1
        else {
            debugPrint("재고가 부족하여 제작에 실패하였습니다.")
            return false
        }
        
        return true
    }
}
