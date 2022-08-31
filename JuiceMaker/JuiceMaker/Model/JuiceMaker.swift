//  Created by 애종,질리,벨라 on 2022/08/30.

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func takeOrder(juice: Juice) {
        if fruitStore.checkRemainedStock(juiceRecipe: juice.recipe.first) == false {
            return
        }
        
        if let secondFruit = juice.recipe.second {
            if fruitStore.checkRemainedStock(juiceRecipe: secondFruit) == false {
                return
            }
        }
        
        make(juice)
    }
    
    func make(_ juice: Juice) {
        fruitStore.subtractFruitStock(fruit: juice.recipe.first.0, amount: juice.recipe.first.1)
        
        if let secondFruit = juice.recipe.second {
            fruitStore.subtractFruitStock(fruit: secondFruit.0, amount: secondFruit.1)
        }
        
        debugPrint("\(juice)를 만들었습니다!")
    }
}
