//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    let recipe = [
        "strawberryJuice": ["strawberry": 16],
        "bananaJuice": ["banana": 2],
        "kiwiJuice": ["kiwi": 3],
        "pineapple": ["pineapple": 2],
        "strawberryBananaJuice": ["stawberry": 10, "banana": 1],
        "mangoJuice": ["mango": 3],
        "mangoKiwiJuice": ["mango": 2, "kiwi": 1]
    ]
}
