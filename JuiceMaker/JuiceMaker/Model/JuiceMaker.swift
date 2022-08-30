//  Created by 애종,질리,벨라 on 2022/08/30.

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func takeOrder(juice: Juice) {
        if let secondJuice = juice.recipe.second {
            checkRemainedStock(juiceRecipe: secondJuice)
        }
        checkRemainedStock(juiceRecipe: juice.recipe.first)
    }
    
    func checkRemainedStock(juiceRecipe: (Fruit, Int)) {
        guard let fruitStock = self.fruitStore.fruitStock[juiceRecipe.0],
              fruitStock < juiceRecipe.1 else {
            return
        }
    }
}
