//
//  JuiceMaker - FruitStore.swift
//
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    var stocks: [Fruit: Int] = [:]
    
    init(defaultFruitStock: Int) {
        Fruit.allCases.forEach { stocks[$0] = defaultFruitStock }
    }
}
