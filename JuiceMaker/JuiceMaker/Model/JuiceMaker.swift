//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case ddalbaJuice
    case mangoKiwiJuice
}

// 쥬스 메이커 타입 
struct JuiceMaker {
    let fruitStore: [FruitStore] = [
        StrawberryStock(),
        BananaStock(),
        PineappleStock(),
        KiwiStock(),
        MangoStock()
        ]
    
    func makeJuice() {
       
        }
        
    
    func checkStock(fruit: Fruit) {
//        for value in fruitStore {
//            if value.
        }
    
}
