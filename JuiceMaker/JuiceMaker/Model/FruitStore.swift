//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore: Storable {
    
    private(set) var stocks: [FruitCounter]
    
    init(stocks: [FruitCounter]) {
        self.stocks = stocks
    }
    
    func change(_ stuff: Stuff, to count: Int) {
        guard let enumFruit = Fruit(rawValue: stuff.name) else {
            return
        }
        let counter = FruitCounter(fruit: enumFruit, count: count)
        let targetFruits = stocks.enumerated().filter { $0.element.fruit == enumFruit }
        let targetOffsets = targetFruits.map { $0.offset }
        
        targetOffsets.indices.forEach { stocks.remove(at: $0) }
        stocks.append(counter)
    }
    
}
