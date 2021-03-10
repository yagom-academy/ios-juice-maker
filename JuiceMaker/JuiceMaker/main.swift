//
//  main.swift
//  JuiceMaker
//
//  Created by 김찬우 on 2021/03/08.
//

import Foundation

class FruitStock {
    
    enum FruitJuice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
    
    fileprivate(set) var strawberry: Int = 10
    fileprivate(set) var banana: Int = 10
    fileprivate(set) var kiwi: Int = 10
    fileprivate(set) var pineapple: Int = 10
    fileprivate(set) var mango: Int = 10
}

let currentFruitStock = FruitStock()

class JuiceMaker: FruitStock {
    
    func checkFruitStock() {
        print("과일 재고 : 딸기 \(strawberry), 바나나 \(banana), 파인애플 \(pineapple), 키위 \(kiwi), 망고 \(mango)")
    }
    
    func addAmount(of: inout Int, as much: Int) {
        of = of + much
    }
    
    func subtractAmount(of: inout Int, as much: Int) {
        of = of - much
    }
    
    func canmakeJuice(amount: Int, subtract: Int) -> Bool {
        if amount >= subtract {
            return true
        } else {
            return false
        }
    }
    
    func manufactureJuice(juice: FruitJuice) {
        switch juice {
        case .strawberryJuice:
            subtractAmount(of: &strawberry, as: 16)
        case .bananaJuice:
            subtractAmount(of: &banana, as: 2)
        case .kiwiJuice:
            subtractAmount(of: &kiwi, as: 3)
        case .pineappleJuice:
            subtractAmount(of: &pineapple, as: 2)
        case .strawberryBananaJuice:
            subtractAmount(of: &strawberry, as: 10)
            subtractAmount(of: &banana, as: 1)
        case .mangoJuice:
            subtractAmount(of: &mango, as: 3)
        case .mangoKiwiJuice:
            subtractAmount(of: &mango, as: 2)
            subtractAmount(of: &kiwi, as: 1)
        }
    }
    
    func startJuiceMaking() {
        checkFruitStock()
        if canmakeJuice(amount: strawberry, subtract: 16) {
            manufactureJuice(juice: .strawberryJuice)
        }
        print(strawberry)
    }
}


let abc = JuiceMaker()
abc.startJuiceMaking()
