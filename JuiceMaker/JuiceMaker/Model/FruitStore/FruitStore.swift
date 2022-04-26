//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Fruits = [Fruit: Int]

protocol Fruitable {
    /// 과일 수량 반환 함수
    ///
    /// Return : Int
    func count(of fruit: Fruit) -> Int?
    
    /// 과일 수 추가 함수
    ///
    func add(fruit: Fruit, as amount: Int)
    
    /// 과일 소진 시키는 함수
    ///
    func consume(fruits: Fruits)
}

//MARK: 과일 저장소 타입
final class FruitStore: Fruitable {
    private var fruits: Fruits = [:]
    
    init(initialValue: Int = 10) {
        for fruit in Fruit.allCases {
            self.fruits.updateValue(initialValue, forKey: fruit)
        }
    }
}

extension FruitStore {
    func count(of fruit: Fruit) -> Int? {
        return fruits[fruit]
    }
    
    func add(fruit: Fruit, as amount: Int) {
        fruits.updateValue((fruits[fruit] ?? 10) + amount, forKey: fruit)
    }
    
    func consume(fruits: Fruits) {
        do{
            try figure(out: fruits)
            for (fruit, amount) in fruits {
                self.fruits.updateValue((fruits[fruit] ?? 10) - amount, forKey: fruit)
            }
        } catch let error {
            print("에러: \(error)")
        }
    }
}

private extension FruitStore {
    /// 재료 수량 파악하는 함수
    ///
    /// throws : StockError
    func figure(out fruits: Fruits) throws {
        for (fruit, amount) in fruits {
            if self.fruits[fruit] ?? 0 < amount {
                throw StockError.notEnoughIngredient
            }
        }
    }
}
