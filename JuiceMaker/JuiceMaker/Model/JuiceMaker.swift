//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func make(juice: Juice) {
        do {
          try fruitStore.consumeStock(with: juice)
        } catch {
            print("")
        }
    }
}
