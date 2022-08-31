//  Created by 애종,질리,벨라 on 2022/08/30.

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func takeOrder(juice: Juice) {
        if let secondJuice = juice.recipe.second {
            fruitStore.checkRemainedStock(juiceRecipe: secondJuice)
        }
        fruitStore.checkRemainedStock(juiceRecipe: juice.recipe.first)
        
        // 제조
    }
    
    func make(_ juice: Juice) {
        if let secondJuice = juice.recipe.second {
            fruitStore.updateFruitStock(fruit: secondJuice.0, plusOrMinus: "-", amount: secondJuice.1)
        }
    }
}
