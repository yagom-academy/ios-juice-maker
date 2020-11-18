//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    var fruitDictionary: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func checkFruitStock() {
        for fruit in fruitDictionary {
            print("\(fruit.key)는 \(fruit.value)개 남아 있습니다.")
        }
    }
    
    //Fruit에 새로운 과일 case를 추가하고 진행해야 할 듯 하다(이게 효율적인 방법일까?)
    //이미 존재하는 과일을 추가 하려고 할때 에러처리 코드 구현해봐야함
    mutating func addFruit(newFruit: Fruit, fruitStock: Int) {
        fruitDictionary[newFruit] = fruitStock
    }
    
    mutating func makeStrawberryJuice() {
        guard let currentStock = fruitDictionary[.strawberry], currentStock >= 16 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.strawberry]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = currentStock - 16
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .strawberry)
    }
    
    mutating func makeBananaJuice() {
        guard let currentStock = fruitDictionary[.banana], currentStock >= 2 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.banana]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = currentStock - 2
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .banana)
    }
    
    mutating func makePineappleJuice() {
        guard let currentStock = fruitDictionary[.pineapple], currentStock >= 2 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.pineapple]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = currentStock - 2
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .pineapple)
    }
    
    mutating func makeKiwiJuice() {
        guard let currentStock = fruitDictionary[.kiwi], currentStock >= 3 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.kiwi]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = currentStock - 3
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .kiwi)
    }
    
    mutating func makeMangoJuice() {
        guard let currentStock = fruitDictionary[.mango], currentStock >= 3 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.mango]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = currentStock - 3
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .mango)
    }
    
}
