//
//  RequiredFruitQuantity.swift
//  JuiceMaker
//
//  Created by JSB on 2023/05/09.
//

struct RequiredFruitQuantity {
    private var strawBerry: Int = 16
    private var banana: Int = 2
    private var pineApple: Int = 2
    private var kiwi: Int = 3
    private var mango: Int = 3
    

    
    mutating func change(_ juice: Juice) {
        if juice == .strawBerryJuice {
            self.strawBerry = 16
        } else if juice == .bananaJuice {
            self.banana = 2
        } else if juice == .pineAppleJuice {
            self.pineApple = 2
        } else if juice == .kiwiJuice {
            self.kiwi = 3
        } else if juice == .mangoJuice {
            self.mango = 3
        } else if juice == .strawBerryBananaJuice {
            self.strawBerry = 10
            self.banana = 1
        } else if juice == .mangoKiwiJuice {
            self.mango = 2
            self.kiwi = 1
        } else {
            print("없는 주스")
        }
    }
}

