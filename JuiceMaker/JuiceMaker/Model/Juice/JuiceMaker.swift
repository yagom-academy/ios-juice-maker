//  Created by 애종,질리,벨라 on 2022/08/30.

import UIKit

struct JuiceMaker {
    private let fruitStore: FruitStoreProtocol = FruitStore()
    
    private func takeOrder(juice: Juice) {
        do {
            try fruitStore.isEnoughStock(juiceRecipe: juice.recipe)
            make(juice)
            noticeResultOfJuiceMaking(isSuccess: true)
        } catch JuiceMakerError.notEnoughStock {
            debugPrint("재고가 부족하여 제작에 실패하였습니다!")
            noticeResultOfJuiceMaking(isSuccess: false)
        } catch {
            debugPrint("알 수 없는 오류가 발생하였습니다.")
        }
    }
    
    func noticeResultOfJuiceMaking(isSuccess: Bool) {
        NotificationCenter.default.post(name: Notification.Name("resultInmakingJuice"), object: nil, userInfo: ["isMakingSuccess": isSuccess])
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
    
    func sendFruitStockValue() -> [Fruit : Int] {
        return fruitStore.sendFruitStockValue()
    }
}
