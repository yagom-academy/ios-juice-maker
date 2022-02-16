//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// 과일의 이름, 개수
typealias Fruits = [Fruit: Int]

/// 과일 저장소 타입
protocol FruitStoreType {
    func count(of fruit: Fruit) -> Int
    func add(_ fruit: Fruit, amount: Int)
    func consume(_ fruit: Fruit, amount: Int)
    func consume(ingredients: Fruits)
}

/// 과일을 위한 기능  클래스
final class FruitStore: FruitStoreType {
    private var fruits: Fruits

    /// - Default Value : 10
    init(initialValue: Int = 10) {
        self.fruits = Fruit.allCases.toFruits(with: initialValue)
    }

    /// 과일의 개수를 파악하기 위한 함수
    /// - fruit : 과일 이름
    func count(of fruit: Fruit) -> Int {
        return fruits[fruit] ?? 0
    }

    /// 과일의 개수를 늘리기 위한 함수
    /// - fruit : 과일 이름
    /// - amount : 수량
    func add(_ fruit: Fruit, amount: Int = 1) {
        fruits[fruit]? += amount
    }

    /// [테스트] 과일의 재고가 소진 될 수 있도록 초기값을 설정
    /// - fruit : 과일 이름
    /// - amount : 수량
    func consume(_ fruit: Fruit, amount: Int = 1) {
        fruits[fruit]? -= amount
    }

    /// 과일의 재고가 소진 될 경우 수량을 줄이기 위한 함수
    /// - ingredients : 과일 이름, 개수
    /// (소진되는 재료 or 재료들 : 개수)
    func consume(ingredients: Fruits) {
        ingredients.forEach { fruit, amount in
            fruits[fruit]? -= amount
        }
    }
}

extension Array where Element == Fruit {
    /// 과일들의 초기값을 생성하기 위한 함수
    /// - initialValue : 과일 개수
    func toFruits(with initialValue: Int) -> Fruits {
        var fruits: Fruits = [:]

        self.forEach { fruit in
            fruits[fruit] = initialValue
        }

        return fruits
    }
}
