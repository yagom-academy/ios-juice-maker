//  Created by 애종,질리,벨라 on 2022/08/30.

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func takeOrder(juice: Juice) {
        // 재고 확인
        checkRemainedStock(juiceRecipe: juice.recipe)
        // 제조
        
    }
    
    func checkRemainedStock(juiceRecipe: Juice.Recipe) -> Bool {
        debugPrint(juiceRecipe)
        var flag: Bool = false
        guard let firstFruitStock = self.fruitStore.fruitStock[juiceRecipe.first.0] else { return false
        }
        
        if firstFruitStock < juiceRecipe.first.1 {
            return false
        }
        
        guard let secondFruit = juiceRecipe.second else { return false }
                
        guard let secondFruitStock = self.fruitStore.fruitStock[secondFruit.0] else {
            return false
        }
        
        if secondFruitStock < secondFruit.1 {
            return false
        }
        return true
    }
    
}
