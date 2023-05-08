//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    var strawBerry: Int
    var banana: Int
    var pineApple: Int
    var kiwi: Int
    var mango: Int
    
    init(strawBerry: Int = 10, banana: Int = 10, pineApple: Int = 10, kiwi: Int = 10, mango: Int = 10) {
        self.strawBerry = strawBerry
        self.banana = banana
        self.pineApple = pineApple
        self.kiwi = kiwi
        self.mango = mango
    }
    
    private func addStoredFruit(_ fruit: String, _ stock: Int) {
        switch fruit {
        case "딸기":
            self.strawBerry += stock
        case "바나나":
            self.banana += stock
        case "파인애플":
            self.pineApple += stock
        case "키위":
            self.kiwi += stock
        case "망고":
            self.mango += stock
        default:
            print("없는 과일")
        }
    }
    
    private func removeStoredFruit(_ fruit: String, _ stock: Int) {
        switch fruit {
        case "딸기":
            self.strawBerry -= stock
        case "바나나":
            self.banana -= stock
        case "파인애플":
            self.pineApple -= stock
        case "키위":
            self.kiwi -= stock
        case "망고":
            self.mango -= stock
        default:
            print("없는 과일")
        }
    }
    
    func removeFruit(_ juice: String) {
        switch juice {
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
