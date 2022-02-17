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
    /// 지정한 과일의 개수를 반환합니다.
    ///
    /// - Parameters:
    ///     - fruit : 과일 이름
    func count(of fruit: Fruit) -> Int
    
    /// 지정한 과일을 지정한 개수로 설정합니다.
    ///
    /// - Parameters:
    ///     - fruit : 과일 이름
    ///     - amount : 과일 수량
    func setAmount(for fruit: Fruit, to amount: Int)
    
    /// 필요한 재료의 수량만큼 재고를 소모합니다.
    ///
    /// - Parameters:
    ///     - ingredients :  과일 이름, 수량
    func consume(ingredients: Fruits)
    
    /// 지정한 쥬스를 만들기에 재고가 충분한지 확인합니다.
    ///
    /// - Parameters:
    ///     - juice :  쥬스 이름
    ///
    /// - Returns:필요 재료의 수량 유무에 따라 true or false
    func hasIngredients(for juice: Juice) -> Bool
}

/// 과일을 위한 기능  클래스
final class FruitStore: FruitStoreType {
    private var fruits: Fruits
    
    init(initialValue: Int = 10) {
        self.fruits = Fruit.allCases.toFruits(with: initialValue)
    }
    
    func count(of fruit: Fruit) -> Int {
        return fruits[fruit] ?? 0
    }
    
    func setAmount(for fruit: Fruit, to amount: Int) {
        fruits.updateValue(amount, forKey: fruit)
    }
    
    func consume(ingredients: Fruits) {
        for (fruit, amount) in ingredients {
            consume(fruit, amount: amount)
        }
    }
    
    /// 지정한 과일의 재고를 지정한 개수만큼 소진합니다.
    private func consume(_ fruit: Fruit, amount: Int) {
        let existingValueForFruit = fruits[fruit] ?? 0
        fruits.updateValue(existingValueForFruit - amount, forKey: fruit)
    }
    
    func hasIngredients(for juice: Juice) -> Bool {
        let subtracted = fruits - juice.ingredients
        
        for amount in subtracted.values where amount < 0 {
            return false
        }
        
        return true
    }
}

extension Array where Element == Fruit {
    /// 과일 종류 배열을 수량을 가진 딕셔너리로 변환하여 반환합니다.
    func toFruits(with initialValue: Int) -> Fruits {
        return self.toDictionary(with: initialValue)
    }
}
