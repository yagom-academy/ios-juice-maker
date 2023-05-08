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
    
    func removeFruitJuice(_ fruit: String) throws {
        switch fruit {
        case "딸기주스":
            guard strawBerry > 16 else {
                throw FruitStoreError.countError
            }
            self.strawBerry -= 16
        case "바나나주스":
            guard banana > 2 else {
                throw FruitStoreError.countError
            }
            self.banana -= 2
        case "키위주스":
            guard kiwi > 3 else {
                throw FruitStoreError.countError
            }
            self.kiwi -= 3
        case "파인애플주스":
            guard pineApple > 2 else {
                throw FruitStoreError.countError
            }
            self.pineApple -= 2
        case "딸바주스":
            guard strawBerry > 10, banana < 1 else {
                throw FruitStoreError.countError
            }
            self.strawBerry -= 10
            self.banana -= 1
        case "망고주스":
            guard mango > 3 else {
                throw FruitStoreError.countError
            }
            self.mango -= 3
        case "망고키위주스":
            guard mango > 2, kiwi > 1 else {
                throw FruitStoreError.countError
            }
            self.mango -= 2
            self.kiwi -= 1
        default:
            print("")
        }
    }
    func error(_ fruit: String) {
        do {
            try removeFruitJuice(fruit)
        } catch FruitStoreError.countError {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
