//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    var fruitBasket: [Fruit: Int]
    
    init(count: Int = 10) {
        let allFruits = Fruit.allCases
        let fruitscount = Array(repeating: count, count: allFruits.count)
        
        self.fruitBasket = Dictionary(uniqueKeysWithValues: zip(allFruits, fruitscount))
    }
    
    func changeAmount(count: Int, of fruit: Fruit, by calculator: (Int, Int) -> Int) {
        guard count > 0 else {
            print("수량을 잘못 입력하였습니다.")
            return
        }
        guard let oldFruitCount = fruitBasket[fruit] else {
            print("선택한 과일이 존재하지 않습니다.")
            return
        }
        let newFruitCount = calculator(oldFruitCount, count)
        guard newFruitCount >= 0 else {
            print("과일의 재고가 부족합니다.")
            return
        }
        fruitBasket[fruit] = newFruitCount
    }
}


