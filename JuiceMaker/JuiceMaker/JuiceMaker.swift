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
    private(set) var stock: Int
    
    init(fruitType: FruitsType) {
        self.fruitType = fruitType
        self.stock = 10
    }
    
    func addStock(_ add: Int) {
        self.stock = self.stock + add
    }
    
    func useStock(_ use: Int) {
        self.stock = self.stock - use
    }
    
    func canMakeJuice(need: Int) -> Bool {
        return stock >= need
    }
}

enum JuicesType {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBanana
    case mango
    case mangoKiwi
}

struct JuiceRecipe {
    let strawberry: [FruitsType : Int] = [.strawberry : 16]
    let banana: [FruitsType : Int] = [.banana : 2]
    let kiwi: [FruitsType : Int] = [.kiwi: 3]
    let pineapple: [FruitsType : Int] = [.pineapple : 2]
    let strawberryBanana: [FruitsType : Int] = [.strawberry : 10, .banana : 1]
    let mango: [FruitsType : Int] = [.mango : 3]
    let mangoKiwi: [FruitsType : Int] = [.mango : 2, .kiwi : 1]
    
    func getJuiceRecipe(_ juiceType: JuicesType) -> [FruitsType : Int] {
        switch juiceType {
        case .strawberry:
            return strawberry
        case .banana:
            return banana
        case .kiwi:
            return kiwi
        case .pineapple:
            return pineapple
        case .strawberryBanana:
            return strawberryBanana
        case .mango:
            return mango
        case .mangoKiwi:
            return mangoKiwi
        }
    }
}

class JuiceMaker {
    
    private let recipe = JuiceRecipe()
    
    var strawberry = Fruit(fruitType: .strawberry)
    var banana = Fruit(fruitType: .banana)
    var pineapple = Fruit(fruitType: .pineapple)
    var kiwi = Fruit(fruitType: .kiwi)
    var mango = Fruit(fruitType: .mango)
    
    func addStock(fruitType: FruitsType, stock: Int) {
        switch fruitType {
        case .strawberry:
            strawberry.addStock(stock)
        case .banana:
            banana.addStock(stock)
        case .pineapple:
            pineapple.addStock(stock)
        case .kiwi:
            kiwi.addStock(stock)
        case .mango:
            mango.addStock(stock)
        }
    }
    
    func choiceJuice(juice: JuicesType) throws {
        let juiceRecipe: [FruitsType : Int] = recipe.getJuiceRecipe(juice)
        
        for (key, value) in juiceRecipe {
            guard checkStock(fruitType: key, needStock: value) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (key, value) in juiceRecipe {
            makeJuice(fruitType: key, use: value)
        }
    }
    
    func checkStock(fruitType: FruitsType, needStock: Int) -> Bool {
        switch fruitType {
        case .strawberry:
            return strawberry.canMakeJuice(need: needStock)
        case .banana:
            return banana.canMakeJuice(need: needStock)
        case .pineapple:
            return pineapple.canMakeJuice(need: needStock)
        case .kiwi:
            return kiwi.canMakeJuice(need: needStock)
        case .mango:
            return mango.canMakeJuice(need: needStock)
        }
    }
    
    func makeJuice(fruitType: FruitsType, use: Int) {
        switch fruitType {
        case .strawberry:
            strawberry.useStock(use)
        case .banana:
            banana.useStock(use)
        case .pineapple:
            pineapple.useStock(use)
        case .kiwi:
            kiwi.useStock(use)
        case .mango:
            mango.useStock(use)
        }
    }
}
