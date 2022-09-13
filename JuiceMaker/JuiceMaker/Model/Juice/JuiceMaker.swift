//  Created by 애종,질리,벨라 on 2022/08/30.

import UIKit

struct JuiceMaker {
    private let fruitStore: FruitStoreProtocol = FruitStore()
    
}

extension JuiceMaker: JuiceMakerProtocol {
    
    func getFruitStock() -> FruitStock {
        return fruitStore.sendFruitStock()
    }
    
    func noticeResultOfJuiceMaking(isSuccess: Bool, juiceName: String) {
        NotificationCenter.default.post(
            name: .resultInmakingJuice,
            object: nil,
            userInfo: ["isMakingSuccess": isSuccess, "juiceName": juiceName])
    }
    
    func canMakeJuice(_ recipe: [Juice.Recipe]) throws {
        return try fruitStore.checkEnoughStock(juiceRecipe: recipe)
    }
    
    func make(_ juice: Juice) {
        for ingredient in juice.recipe {
            fruitStore.updateFruitStock(
                fruit: ingredient.fruit,
                variation: .decrease,
                amount: ingredient.amount
            )
        }
        
        debugPrint("\(juice)를 만들었습니다!")
    }
}

extension Notification.Name {
    static let resultInmakingJuice = Notification.Name("resultInmakingJuice")
}
