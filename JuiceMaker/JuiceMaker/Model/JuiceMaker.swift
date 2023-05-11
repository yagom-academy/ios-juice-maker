//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let store: FruitStore
    private let juiceRecipeBook: [Juice]
    
    init(store: FruitStore) {
        self.store = store
        self.juiceRecipeBook = [
            Juice(name: "딸기", recipe: [.strawberry: 16]),
            Juice(name: "바나나", recipe: [.banana: 2]),
            Juice(name: "키위", recipe: [.kiwi: 3]),
            Juice(name: "파인애플", recipe: [.pineapple: 2]),
            Juice(name: "망고", recipe: [.mango: 3]),
            Juice(name: "딸바", recipe: [.strawberry: 10, .banana: 1]),
            Juice(name: "망키", recipe: [.mango: 2, .kiwi: 1])
        ]
    }
}
