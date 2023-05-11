//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    let juiceRecipe: [Juice: [Fruit: Int]] = [
        Juice.strawberryJuice: [Fruit.strawberry: 16],
        Juice.bananaJuice: [Fruit.banana: 2],
        Juice.kiwiJuice: [Fruit.kiwi: 3],
        Juice.pineappleJuice: [Fruit.pineapple: 2],
        Juice.strawberryBananaJuice: [Fruit.strawberry: 10, Fruit.banana: 1],
        Juice.mangoJuice: [Fruit.mango: 3],
        Juice.mangoKiwiJuice: [Fruit.mango: 2, Fruit.kiwi: 1]
    ]
    
    func makeJuice(_ juice: String) throws {
        
    }
}

refactor: Juice 열거형 생성, Juice를 키로 가지는 JuiceRecipe 생성
