//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum FruitsType : String {
    case strawberry = "🍓"
    case banana = "🍌"
    case pineapple = "🍍"
    case kiwi = "🥝"
    case mango = "🥭"
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

// TODO: add Error Handle
class JuiceMaker {
    
    static let shared = JuiceMaker()
    private init() {}
    
    private let recipe = JuiceRecipe()
    
    private var fruits: [FruitsType : Fruit] = [
        .strawberry : Fruit(fruitType: .strawberry),
        .banana : Fruit(fruitType: .banana),
        .pineapple : Fruit(fruitType: .pineapple),
        .kiwi : Fruit(fruitType: .kiwi),
        .mango : Fruit(fruitType: .mango)
    ]
    
    func getFruits() -> [FruitsType : Fruit] {
        return fruits
    }
    
    func addStock(fruitType: FruitsType, stock: Int) throws {
        guard let fruit = fruits[fruitType] else {
            throw JuiceMakerError.notFound
        }
        
        fruit.addStock(stock)
    }
    
    func choiceJuice(juice: JuicesType) throws {
        let juiceRecipe: [FruitsType : Int] = recipe.getJuiceRecipe(juice)
        
        for (key: fruit, value: stock) in juiceRecipe {
            
            guard let fruit = fruits[fruit] else {
                throw JuiceMakerError.notFound
            }
            
            guard fruit.canMakeJuice(need: stock) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (key: fruit, value: stock) in juiceRecipe {
            try makeJuice(fruitType: fruit, use: stock)
        }
    }
    
    func makeJuice(fruitType: FruitsType, use: Int) throws {
        
        guard let fruit = fruits[fruitType] else {
            throw JuiceMakerError.notFound
        }
        
        fruit.useStock(use)
    }
}
