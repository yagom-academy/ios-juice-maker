//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore: FruitStore
    
    func make(juice: Juice) {
        do {
          try fruitStore.consumeStock(with: juice)
        } catch {
            print("재료가 모자라요. 재고를 수정할까요?")
        }
    }
}
