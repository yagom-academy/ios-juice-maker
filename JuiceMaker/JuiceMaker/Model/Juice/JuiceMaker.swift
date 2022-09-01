//  Created by 애종,질리,벨라 on 2022/08/30.

struct JuiceMaker {
    private let fruitStore: FruitStoreProtocol = FruitStore()
    
    private func takeOrder(juice: Juice) {
        if fruitStore.isEnoughStock(juiceRecipe: juice.recipe.first) == false {
            debugPrint("재고가 부족하여 제작에 실패하였습니다.")
            return
        }
        
        if let secondFruit = juice.recipe.second {
            if fruitStore.isEnoughStock(juiceRecipe: secondFruit) == false {
                debugPrint("재고가 부족하여 제작에 실패하였습니다.")
                return
            }
        }
        
        make(juice)
    }
    
    private func make(_ juice: Juice) {
        fruitStore.subtractFruitStock(fruit: juice.recipe.first.0, amount: juice.recipe.first.1)
        
        if let secondFruit = juice.recipe.second {
            fruitStore.subtractFruitStock(fruit: secondFruit.0, amount: secondFruit.1)
        }
        
        debugPrint("\(juice)를 만들었습니다!")
    }
}

extension JuiceMaker: JuiceMakerProtocol {
    func chooseJuice(juice: Juice) {
        takeOrder(juice: juice)
    }
}
