//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    
    func make(_ juice: Juice) {
        do {
            let recipe = juice.recipe
            
            try FruitStore.shared.reduce(by: recipe)
        } catch {
            print("재고 부족")
        }
    }
}
