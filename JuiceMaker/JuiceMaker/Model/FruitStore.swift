//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Fruits = [Fruit: Int]

/// 과일 저장소 타입
protocol FruitStoreType {
    func count(of fruit: Fruit) -> Int
    func add(_ fruit: Fruit, amount: Int)
    func consume(_ fruit: Fruit, amount: Int)
    func consume(ingredients: Fruits)
}

final class FruitStore: FruitStoreType {
    private var fruits: Fruits

    init(initialValue: Int = 10) {
        self.fruits = Fruit.allCases.toFruits(with: initialValue)
    }

    func count(of fruit: Fruit) -> Int {
        return fruits[fruit] ?? 0
    }

    func add(_ fruit: Fruit, amount: Int = 1) {
        fruits[fruit]? += amount
    }

    func consume(_ fruit: Fruit, amount: Int = 1) {
        fruits[fruit]? -= amount
    }

    func consume(ingredients: Fruits) {
        ingredients.forEach { fruit, amount in
            fruits[fruit]? -= amount
        }
    }
}

extension Array where Element == Fruit {
    func toFruits(with initialValue: Int) -> Fruits {
        var fruits: Fruits = [:]

        self.forEach { fruit in
            fruits[fruit] = initialValue
        }

        return fruits
    }
}
