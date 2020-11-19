//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let initialStock: Int
    var fruitDictionary: [Fruit: Int]
    
    init(initialStock: Int) {
        self.initialStock = initialStock
        self.fruitDictionary = [.strawberry: initialStock, .banana: initialStock, .pineapple: initialStock, .kiwi: initialStock, .mango: initialStock]
    }
    
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
        guard let stock = fruitDictionary[.strawberry], stock >= 16 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.strawberry]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = stock - 16
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .strawberry)
    }
    
    mutating func makeBananaJuice() {
        guard let stock = fruitDictionary[.banana], stock >= 2 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.banana]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = stock - 2
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .banana)
    }
    
    mutating func makePineappleJuice() {
        guard let stock = fruitDictionary[.pineapple], stock >= 2 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.pineapple]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = stock - 2
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .pineapple)
    }
    
    mutating func makeKiwiJuice() {
        guard let stock = fruitDictionary[.kiwi], stock >= 3 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.kiwi]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = stock - 3
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .kiwi)
    }
    
    mutating func makeMangoJuice() {
        guard let stock = fruitDictionary[.mango], stock >= 3 else {
            print("재고가 부족합니다. 현재 재고는 \(fruitDictionary[.mango]!)개 입니다.")
            //재고 부족시 경고창뜨는거 구현해야함
            return
        }
        let stockAfterMakingJuice = stock - 3
        fruitDictionary.updateValue(stockAfterMakingJuice, forKey: .mango)
    }
    
    mutating func makeStrawberryAndBananaJuice() {
        guard let strawberryStock = fruitDictionary[.strawberry], let bananaStock = fruitDictionary[.banana], strawberryStock >= 10, bananaStock >= 1 else {
            print("재고가 부족합니다. 현재 딸기 재고는 \(fruitDictionary[.strawberry]!)개 이고, 바나나 재고는 \(fruitDictionary[.banana]!)개 입니다.")
            //재고 부족시 경고창 뜨는건 구현해야함
            return
        }
        let strawberryStockAfterMakingJuice = strawberryStock - 10
        let bananaStockAfterMakingJuice = bananaStock - 1
        fruitDictionary.updateValue(strawberryStockAfterMakingJuice, forKey: .strawberry)
        fruitDictionary.updateValue(bananaStockAfterMakingJuice, forKey: .banana)
    }
    
    mutating func makeMangoAndKiwiJuice() {
        guard let mangoStock = fruitDictionary[.mango], let kiwiStock = fruitDictionary[.kiwi], mangoStock >= 2, kiwiStock >= 1 else {
            print("재고가 부족합니다. 현재 망고 재고는 \(fruitDictionary[.mango]!)개 이고, 키위 재고는 \(fruitDictionary[.kiwi]!)개 입니다.")
            //재고 부족시 경고창 뜨는건 구현해야함
            return
        }
        let mangoStockAfterMakingJuice = mangoStock - 2
        let kiwiStockAfterMakingJuice = kiwiStock - 1
        fruitDictionary.updateValue(mangoStockAfterMakingJuice, forKey: .mango)
        fruitDictionary.updateValue(kiwiStockAfterMakingJuice, forKey: .kiwi)
    }
    
    mutating func addFruitStock(fruit: Fruit) {
        guard let fruitStock = fruitDictionary[fruit] else {
            return
        }
        fruitDictionary.updateValue(fruitStock + 1, forKey: fruit)
    }
}
