//
//  main.swift
//  JuiceMaker
//
//  Created by 김찬우 on 2021/03/08.
//

import Foundation

enum FruitJuice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case straw_nanaJuice
    case mangoJuice
    case mango_KiwiJuice
}

class Fruit {
    var strawberry: Int = 10
    var banana: Int = 10
    var kiwi: Int = 10
    var pineapple: Int = 10
    var mango: Int = 10
}

class JuiceMakers: Fruit {
    
    func checkFruitStock(a: Int) {
        print(a)
    }
    
    func startJuiceMaking() {
        checkFruitStock(a: strawberry)
    }
}


let abc = JuiceMakers()
abc.startJuiceMaking()
