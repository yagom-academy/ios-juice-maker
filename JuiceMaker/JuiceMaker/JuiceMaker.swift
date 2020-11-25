//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceName: String {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}

enum FruitName: String {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class Stock {
    private(set) var starwberry: UInt
    private(set) var banana: UInt
    private(set) var kiwi: UInt
    private(set) var mango: UInt
    private(set) var pineapple: UInt
    let initialStock: UInt = 10
    
    init() {
        self.starwberry = initialStock
        self.banana = initialStock
        self.kiwi = initialStock
        self.mango = initialStock
        self.pineapple = initialStock
    }
    
    func add(fruitName: FruitName, stock: UInt) {
        switch fruitName {
        case .banana:
            banana += stock
        case .strawberry:
            starwberry += stock
        case .pineapple:
            pineapple += stock
        case .kiwi:
            kiwi += stock
        case .mango:
            mango += stock
        }
    }
    
    func use(fruitName: FruitName, stock: UInt) {
        switch fruitName {
        case .banana:
            banana -= stock
        case .strawberry:
            starwberry -= stock
        case .pineapple:
            pineapple -= stock
        case .kiwi:
            kiwi -= stock
        case .mango:
            mango -= stock
        }
    }
}

struct JuiceMaker {
    var stock = Stock()
    
    func makeJuice(juiceName: JuiceName) {
        switch juiceName {
        case .bananaJuice where stock.banana >= 2:
            stock.use(fruitName: .banana, stock: 2)
        case .strawberryJuice where stock.starwberry >= 16:
            stock.use(fruitName: .strawberry, stock: 16)
        case .pineappleJuice where stock.pineapple >= 2:
            stock.use(fruitName: .pineapple, stock: 2)
        case .kiwiJuice where stock.kiwi >= 3:
            stock.use(fruitName: .kiwi, stock: 3)
        case .mangoJuice where stock.mango >= 3:
            stock.use(fruitName: .mango, stock: 3)
        case .strawberryBananaJuice where stock.starwberry >= 10 && stock.banana >= 1:
            stock.use(fruitName: .strawberry, stock: 10)
            stock.use(fruitName: .banana, stock: 1)
        case .mangoKiwiJuice where stock.mango >= 2 && stock.kiwi >= 1:
            stock.use(fruitName: .mango, stock: 2)
            stock.use(fruitName: .kiwi, stock: 1)
        default:
            print("재고를 확인하세요")
        }
    }
}
