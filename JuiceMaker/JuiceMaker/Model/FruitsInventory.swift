//
//  FruitsInventory.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/02/22.
//

import Foundation

class FruitsInventory: FruitsCount {
    var juice: String
    init(juice: String) {
        self.juice = juice
    }
    func changeQuantity() {
        switch juice {
        case "strawberryJuice":
            print("딸기주스입니다.")
        case "bannaJuice":
            print("바나나주스입니다.")
        case "kiwiJuice":
            print("키위주스입니다.")
        case "pineappleJuice":
            print("파인애플주스입니다.")
        case "strawberryBannaJuice":
            print("딸바주스입니다.")
        case "mangoJuice":
            print("망고주스입니다.")
        default:
            print("어떤 것도 아닙니다.")
        }
    }
}
