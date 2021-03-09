//
//  main.swift
//  JuiceMaker
//
//  Created by 김찬우 on 2021/03/08.
//

import Foundation

enum FruitJuice: Int {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

let currentFruitJuice :FruitJuice = .strawberryJuice

class FruitStock {
    var strawberry: Int = 10
    var banana: Int = 10
    var kiwi: Int = 10
    var pineapple: Int = 10
    var mango: Int = 10
}

let currentFruitStock = FruitStock()

class JuiceMaker: FruitStock {
    
    func checkFruitStock() {
        print("과일 재고 : 딸기 \(strawberry), 바나나 \(banana), 파인애플 \(pineapple), 키위 \(kiwi), 망고 \(mango)")
    }
    
    func manufacture(of: FruitJuice) {
        switch of {
        case .strawberryJuice:
            currentFruitStock.strawberry -= 16
        case .bananaJuice:
            currentFruitStock.banana -= 2
        case .kiwiJuice:
            currentFruitStock.kiwi -= 3
        case .pineappleJuice:
            currentFruitStock.pineapple -= 2
        case .straw_nanaJuice:
            currentFruitStock.strawberry -= 10
            currentFruitStock.banana -= 1
        case .mangoJuice:
            currentFruitStock.mango -= 3
        case .mango_KiwiJuice:
            currentFruitStock.mango -= 2
            currentFruitStock.kiwi -= 1
        }
    }
    
    
    
    func startJuiceMaking() {
        checkFruitStock()
        manufacture(of: currentFruitJuice)
        print(currentFruitStock.strawberry)
    }
}


let abc = JuiceMaker()
abc.startJuiceMaking()
