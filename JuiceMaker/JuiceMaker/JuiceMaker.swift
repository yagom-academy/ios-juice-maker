//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 

enum FruitJuice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

enum Fruit {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango
}

class Stock {
    var strawberryCount: Int = 10
    var bananaCount: Int = 10
    var pineappleCount: Int = 10
    var kiwiCount: Int = 10
    var mangoCount: Int = 10
    
    func add(input: Fruit) {
        switch input {
        case Fruit.strawberry:
            strawberryCount += 1
        case Fruit.banana:
            bananaCount += 1
        case Fruit.kiwi:
            kiwiCount += 1
        case Fruit.pineapple:
            pineappleCount += 1
        case Fruit.mango:
            mangoCount += 1
        }
    }
    
    func subtract(input: Fruit, number: Int) {
        switch input {
        case Fruit.strawberry:
            strawberryCount -= number
        case Fruit.banana:
            bananaCount -= number
        case Fruit.kiwi:
            kiwiCount -= number
        case Fruit.pineapple:
            pineappleCount -= number
        case Fruit.mango:
            mangoCount -= number
        }
    }
    
}

class JuiceMaker {
    var stockBox: Stock = Stock()
    
    func makeJuice(juice: FruitJuice) {
        switch juice {
        case FruitJuice.strawberry:
            stockBox.subtract(input: Fruit.strawberry, number: 16)
        case FruitJuice.banana:
            stockBox.subtract(input: Fruit.banana, number: 2)
        case FruitJuice.kiwi:
            stockBox.subtract(input: Fruit.kiwi, number: 3)
        case FruitJuice.pineapple:
            stockBox.subtract(input: Fruit.pineapple, number: 2)
        case FruitJuice.strawberryBanana:
            stockBox.subtract(input: Fruit.strawberry, number: 10)
            stockBox.subtract(input: Fruit.banana, number: 1)
        case FruitJuice.mango:
            stockBox.subtract(input: Fruit.mango, number: 3)
        case FruitJuice.mangoKiwi:
            stockBox.subtract(input: Fruit.mango, number: 2)
            stockBox.subtract(input: Fruit.kiwi, number: 1)
        }
    }
}
