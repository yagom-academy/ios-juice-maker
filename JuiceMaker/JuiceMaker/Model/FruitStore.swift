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
    
    var requiredFruitQuantity: RequiredFruitQuantity = RequiredFruitQuantity()
    
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
    
    func checkFruitStock(_ juiceName: String) throws {
        switch juiceName {
        case "딸기주스":
            requiredFruitQuantity.change(juiceName)
            guard self.strawBerry > requiredFruitQuantity.strawBerry else {
                throw FruitStoreError.countError
            }
        case "바나나주스":
            requiredFruitQuantity.change(juiceName)
            guard self.banana > requiredFruitQuantity.banana else {
                throw FruitStoreError.countError
            }
        case "키위주스":
            requiredFruitQuantity.change(juiceName)
            guard self.kiwi > requiredFruitQuantity.kiwi else {
                throw FruitStoreError.countError
            }
        case "파인애플주스":
            requiredFruitQuantity.change(juiceName)
            guard self.pineApple > requiredFruitQuantity.pineApple else {
                throw FruitStoreError.countError
            }
        case "딸바주스":
            requiredFruitQuantity.change(juiceName)
            guard self.strawBerry > requiredFruitQuantity.strawBerry, self.banana > requiredFruitQuantity.banana else {
                throw FruitStoreError.countError
            }
        case "망고주스":
            requiredFruitQuantity.change(juiceName)
            guard self.mango > requiredFruitQuantity.mango else {
                throw FruitStoreError.countError
            }
        case "망고키위주스":
            requiredFruitQuantity.change(juiceName)
            guard self.mango > requiredFruitQuantity.mango, self.kiwi > requiredFruitQuantity.kiwi else {
                throw FruitStoreError.countError
            }
        default:
            print("없는 주스입니다.")
        }
    }
}
