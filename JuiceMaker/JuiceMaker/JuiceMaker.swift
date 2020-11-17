//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum FruitsType {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class Fruit {
    let fruitType: FruitsType
    private var stock: Int
    
    init(fruitType: FruitsType) {
        self.fruitType = fruitType
        self.stock = 10
    }
    
    func getStock() -> Int {
        return stock
    }
    
    func addStock(add: Int) {
        self.stock = self.stock + add
    }
    
    func useStock(use: Int) {
        self.stock = self.stock - use
    }
    
    func canMakeJuice(need: Int) -> Bool {
        if stock >= need {
            return true
        }
        return false
    }
}

enum JuicesType {
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

protocol JuiceRecipe {
    func choiceJuice(juice: JuicesType) -> Bool?
    func makeKiwiJuice() throws -> Bool
    func makePineappleJuice() throws -> Bool
    func makeStrawberryBananaJuice() throws -> Bool
    func makeMangoJuice() throws -> Bool
    func makeMangoKiwiJuice() throws -> Bool
}

class JuiceMaker: JuiceRecipe {
    
    var strawberry = Fruit(fruitType: .strawberry)
    var banana = Fruit(fruitType: .banana)
    var pineapple = Fruit(fruitType: .pineapple)
    var kiwi = Fruit(fruitType: .kiwi)
    var mango = Fruit(fruitType: .mango)
    
    func addStock(fruitType: FruitsType, stock: Int) {
        switch fruitType {
        case .strawberry:
            strawberry.addStock(add: stock)
        case .banana:
            banana.addStock(add: stock)
        case .pineapple:
            pineapple.addStock(add: stock)
        case .kiwi:
            kiwi.addStock(add: stock)
        case .mango:
            mango.addStock(add: stock)
        }
    }
    
    func choiceJuice(juice: JuicesType) -> Bool? {
        let result: Bool?
        switch juice {
        case .kiwi:
            result = try? makeKiwiJuice()
        case .pineapple:
            result = try? makePineappleJuice()
        case .strawberryBanana:
            result = try? makeStrawberryBananaJuice()
        case .mango:
            result = try? makeMangoJuice()
        case .mangoKiwi:
            result = try? makeMangoKiwiJuice()
        }
        
        // TOCO: 이후에 choiceJuice 쓰는 곳에서 에러 체크 추가하기
        return result
    }
    
    func makeKiwiJuice() throws -> Bool {
        let needKiwi = 3
        
        guard kiwi.canMakeJuice(need: needKiwi) else {
            throw JuiceMakerError.outOfStock
        }
        
        kiwi.useStock(use: needKiwi)
        return true
    }
    
    func makePineappleJuice() throws -> Bool {
        let needPineapple = 2
        
        guard pineapple.canMakeJuice(need: needPineapple) else {
            throw JuiceMakerError.outOfStock
        }
        
        pineapple.useStock(use: needPineapple)
        return true
    }
    
    func makeStrawberryBananaJuice() throws -> Bool {
        let needStrawberry = 10
        let needBanana = 1
        
        guard strawberry.canMakeJuice(need: needStrawberry),
              banana.canMakeJuice(need: needBanana) else {
            throw JuiceMakerError.outOfStock
        }
        
        strawberry.useStock(use: needStrawberry)
        banana.useStock(use: needBanana)
        return true
    }
    
    func makeMangoJuice() throws -> Bool {
        let needMango = 3
        
        guard mango.canMakeJuice(need: needMango) else {
            throw JuiceMakerError.outOfStock
        }
        
        mango.useStock(use: needMango)
        return true
    }
    
    func makeMangoKiwiJuice() throws -> Bool {
        let needMango = 2
        let needKiwi = 1
        
        guard mango.canMakeJuice(need: needMango),
              kiwi.canMakeJuice(need: needKiwi) else {
            throw JuiceMakerError.outOfStock
        }
        
        mango.useStock(use: needMango)
        kiwi.useStock(use: needKiwi)
        return true
    }
}
