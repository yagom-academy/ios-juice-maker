//  Created by 애종,질리,벨라 on 2022/08/30.

struct JuiceMaker {
    private let fruitStore: FruitStoreProtocol = FruitStore()
    
    private func takeOrder(juice: Juice) {
        if fruitStore.isEnoughStock(juiceRecipe: juice.recipe) {
            make(juice)
        } else {
            debugPrint("재고가 부족하여 제작에 실패하였습니다!")
        }
    }
    
    private func make(_ juice: Juice) {
        for ingredient in juice.recipe {
            fruitStore.updateFruitStock(
                fruit: ingredient.name,
                variation: .decrease,
                amount: ingredient.amount
            )
        }
        
        debugPrint("\(juice)를 만들었습니다!")
    }
}

extension JuiceMaker: JuiceMakerProtocol {
    func chooseJuice(juice: Juice) {
        takeOrder(juice: juice)
    }
}
