//
//  RequiredFruitQuantity.swift
//  JuiceMaker
//
//  Created by JSB on 2023/05/09.
//

struct RequiredFruitQuantity {
    var strawBerry: Int = 16
    var banana: Int = 2
    var pineApple: Int = 2
    var kiwi: Int = 3
    var mango: Int = 3
    
    mutating func change(_ juiceName: String) {
        switch juiceName {
        case "딸기주스":
            self.strawBerry = 16
        case "바나나주스":
            self.banana = 2
        case "키위주스":
            self.kiwi = 3
        case "파인애플주스":
            self.pineApple = 2
        case "딸바주스":
            self.strawBerry = 10
            self.banana = 1
        case "망고주스":
            self.mango = 3
        case "망고키위주스":
            self.mango = 2
            self.kiwi = 1
        default:
            print("오류")
        }
    }
}

