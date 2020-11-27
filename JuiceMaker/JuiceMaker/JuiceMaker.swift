//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
struct JuiceMaker {

    private var strawberry = Fruit(name: "strawberry")
    private var banana = Fruit(name: "banana")
    private var pineapple = Fruit(name: "pineapple")
    private var kiwi = Fruit(name: "kiwi")
    private var mango = Fruit(name: "mango")
    
    let strawberryJuice = JuiceMenu.strawberryJuice(name: "딸기쥬스", requiredStrawberries: 16)
    let bananaJuice = JuiceMenu.bananaJuice(name: "바나나쥬스", requiredBananas: 2)
    let ddalbaJuice = JuiceMenu.ddalbaJuice(name: "딸바쥬스", requiredStrawberries: 10, requiredBananas: 1)
    let mangoJuice = JuiceMenu.mangoJuice(name: "망고쥬스", requiredMangos: 3)
    let mangoKiwiJuice = JuiceMenu.mangoKiwiJuice(name: "망고키위쥬스", requiredMangos: 2, requiredKiwis: 1)
    let kiwiJuice = JuiceMenu.kiwiJuice(name: "키위쥬스", requiredKiwis: 3)
    let pineappleJuice = JuiceMenu.pineappleJuice(name: "파인애플쥬스", requiredPineapples: 2)
    
    var strawberryStock: Int {
        get {
            return self.strawberry.stockAmount()
        }
    }
    var bananaStock: Int {
        get {
            return self.banana.stockAmount()
        }
    }
    var pineappleStock: Int {
        get {
            return self.pineapple.stockAmount()
        }
    }
    var kiwiStock: Int {
        get {
            return self.kiwi.stockAmount()
        }
    }
    var mangoStock: Int {
        get {
            return self.mango.stockAmount()
        }
    }
    
    
    init() {
        
        let initialStock = 10
        
        addStock(amount: initialStock, of: strawberry)
        addStock(amount: initialStock, of: banana)
        addStock(amount: initialStock, of: pineapple)
        addStock(amount: initialStock, of: kiwi)
        addStock(amount: initialStock, of: mango)

    }
    
    mutating func addStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(adding: amount)
    }
    
    mutating func reduceStock(amount: Int, of fruitType: Fruit) {
        fruitType.updateStockAmount(reducing: amount)
    }
    
//    func checkStockAmount(of fruitType: Fruit) -> Int {
//        return fruitType.stockAmount()
//    }
    
    mutating func makeJuice(of order: JuiceMenu) -> String {
        switch order {
        case .strawberryJuice(let name, let requiredStrawberries):
            reduceStock(amount: requiredStrawberries, of: strawberry)
            return name
        case .bananaJuice(let name, let requiredBananas):
            reduceStock(amount: requiredBananas, of: banana)
            return name
        case .ddalbaJuice(let name, let requiredStrawberries, let requiredBananas):
            reduceStock(amount: requiredStrawberries, of: strawberry)
            reduceStock(amount: requiredBananas, of: banana)
            return name
        case .mangoJuice(let name, let requiredMangos):
            reduceStock(amount: requiredMangos, of: mango)
            return name
        case .mangoKiwiJuice(let name, let requiredMangos, let requiredKiwis):
            reduceStock(amount: requiredMangos, of: mango)
            reduceStock(amount: requiredKiwis, of: kiwi)
            return name
        case .kiwiJuice(let name, let requiredKiwis):
            reduceStock(amount: requiredKiwis, of: kiwi)
            return name
        case .pineappleJuice(let name, let requiredPineapples):
            reduceStock(amount: requiredPineapples, of: pineapple)
            return name
        }
    }
    
    func isAvailableMaking(juice: JuiceMenu) -> Bool {
        switch juice {
        case .strawberryJuice(_, let requiredStrawberries):
            guard strawberryStock >= requiredStrawberries else {
                return false
            }
        case .bananaJuice(_, let requiredBananas):
            guard bananaStock >= requiredBananas else {
                return false
            }
        case .ddalbaJuice(_, let requiredStrawberries, let requiredBananas):
            guard strawberryStock >= requiredStrawberries,
                  bananaStock >= requiredBananas else {
                return false
            }
        case .mangoJuice(_, let requiredMangos):
            guard mangoStock >= requiredMangos else {
                return false
            }
        case .mangoKiwiJuice(_, let requiredMangos, let requiredKiwis):
            guard mangoStock >= requiredMangos,
                  kiwiStock >= requiredKiwis else {
                return false
            }
        case .kiwiJuice(_, let requiredKiwis):
            guard kiwiStock >= requiredKiwis else {
                return false
            }
            
        case .pineappleJuice(_, let requiredPineapples):
            guard pineappleStock >= requiredPineapples else {
                return false
            }
        }
        return true
    }
}


