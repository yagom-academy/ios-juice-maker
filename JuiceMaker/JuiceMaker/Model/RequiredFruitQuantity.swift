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
    
    mutating func change(_ juiceName: JuiceName) {
        switch juiceName {
        case .strawBerryJuice:
            self.strawBerry = 16
        case .bananaJuice:
            self.banana = 2
        case .kiwiJuice:
            self.kiwi = 3
        case .pineAppleJuice:
            self.pineApple = 2
        case .strawBerryBananaJuice:
            self.strawBerry = 10
            self.banana = 1
        case .mangoJuice:
            self.mango = 3
        case .mangoKiwiJuice:
            self.mango = 2
            self.kiwi = 1
        }
    }
}

