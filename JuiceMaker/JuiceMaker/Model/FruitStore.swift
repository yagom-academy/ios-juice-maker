//
//  JuiceMaker - FruitStore.swift
//  Created by Kiwi, unchain123.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var fruits = [Fruits:Int]()
    
    init(){
        for fruitStock in Fruits.allCases {
            fruits[fruitStock] = 10
        }
    }
}
