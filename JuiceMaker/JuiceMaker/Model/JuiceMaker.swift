//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    
    func makeJuice(_ juiceName: String) {
        if fruitStore.strawBerry <= 16 {
            fruitStore.removeFruitJuice(juiceName)
        } else if fruitStore.banana <= 2 {
            fruitStore.removeFruitJuice(juiceName)
        } else if fruitStore.kiwi <= 3 {
            fruitStore.removeFruitJuice(juiceName)
        } else if fruitStore.pineApple <= 2 {
            
        }
    }
}


