//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore(fruits: Fruits(strawberry: 10, banana: 10, kiwi: 10, pineapple: 10, mango: 10))

    // MARK: - 메서드
    func make(_ menu: FruitJuice) {
        let result = fruitStore.pickUpFruits(for: menu)
        // TODO: UI에서 쥬스 이름을 표시하게끔 다시 짜 줘야 한다.
        switch result {
        case .success(let juice):
            print(juice.name)
        case .failure(let error):
            print(error.errorDescription)
        }
    }
}
