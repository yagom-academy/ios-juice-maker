//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawBerry: Int
    var banana: Int
    var pineApple: Int
    var kiwi: Int
    var mango: Int
    
    init(strawBerry: Int, banana: Int, pineApple: Int, kiwi: Int, mango: Int) {
        self.strawBerry = 10
        self.banana = 10
        self.pineApple = 10
        self.kiwi = 10
        self.mango = 10
    }
    
    func addFruit(_ fruit: String, _ count: Int) {
        switch fruit {
        case "딸기":
            self.strawBerry += count
        case "바나나":
            self.banana += count
        case "파인애플":
            self.pineApple += count
        case "키위":
            self.kiwi += count
        case "망고":
            self.mango += count
        default:
            print("없는 과일")
        }
    }
    
    func removeFruit(_ fruit: String, _ count: Int) {
        switch fruit {
        case "딸기":
            self.strawBerry -= count
        case "바나나":
            self.banana -= count
        case "파인애플":
            self.pineApple -= count
        case "키위":
            self.kiwi -= count
        case "망고":
            self.mango -= count
        default:
            print("없는 과일")
        }
    }
    
    func removeFruitJuice(_ fruit: String) {
        switch fruit {
        case "딸기주스":
            self.strawBerry -= 16
        case "바나나주스":
            self.banana -= 2
        case "키위주스":
            self.kiwi -= 3
        case "파인애플주스":
            self.pineApple -= 2
        case "딸바주스":
            self.strawBerry -= 10
            self.banana -= 1
        case "망고주스":
            self.mango -= 3
        case "망고키위주스":
            self.mango -= 2
            self.kiwi -= 1
        default:
            print("")
        }
    }
}
