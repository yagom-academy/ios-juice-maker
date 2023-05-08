//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawBerry: Int = 10
    var banana: Int = 10
    var pineApple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    func addFruit(_ fruit: String, _ count: Int) {
        switch fruit {
        case "딸기":
            strawBerry += count
        case "바나나":
            banana += count
        case "파인애플":
            pineApple += count
        case "키위":
            kiwi += count
        case "망고":
            mango += count
        default:
            print("없는 과일")
        }
    }
    func removeFruit(_ fruit: String, _ count: Int) {
        switch fruit {
        case "딸기":
            strawBerry -= count
        case "바나나":
            banana -= count
        case "파인애플":
            pineApple -= count
        case "키위":
            kiwi -= count
        case "망고":
            mango -= count
        default:
            print("없는 과일")
        }
    }
}
