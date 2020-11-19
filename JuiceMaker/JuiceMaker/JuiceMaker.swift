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


enum JuicesName : String {
    case strawberry = "딸기주스"
    case banana = "바나나주스"
    case kiwi = "키위주스"
    case pineapple = "파인애플주스"
    case mango = "망고주스"
    case strawberryBanana = "딸바주스"
    case mangoKiwi = "망키주스"
}

enum JuicesType {
    case single
    case multi
}

struct JuiceRecipe {
    
    typealias Recipe = [FruitsType : Int]
    
    private let juices: [JuicesName: JuicesType] = [
        .strawberry : .single,
        .banana : .single,
        .kiwi : .single,
        .pineapple : .single,
        .mango : .single,
        .strawberryBanana : .multi,
        .mangoKiwi : .multi
    ]
    
    private let strawberry: [FruitsType : Int] = [.strawberry : 16]
    private let banana: [FruitsType : Int] = [.banana : 2]
    private let kiwi: [FruitsType : Int] = [.kiwi : 3]
    private let pineapple: [FruitsType : Int] = [.pineapple : 2]
    private let mango: [FruitsType : Int] = [.mango : 3]
    private let strawberryBanana: [FruitsType : Int] = [.strawberry : 10, .banana : 1]
    private let mangoKiwi: [FruitsType : Int] = [.mango : 2, .kiwi : 1]
    
    func getJuiceRecipe(_ juiceType: JuicesName) -> Recipe {
        switch juiceType {
        case .strawberry:
            return strawberry
        case .banana:
            return banana
        case .kiwi:
            return kiwi
        case .pineapple:
            return pineapple
        case .mango:
            return mango
        case .strawberryBanana:
            return strawberryBanana
        case .mangoKiwi:
            return mangoKiwi
        }
    }
    
    func getAllJuices() -> [JuicesName : JuicesType] {
        return juices
    }
}

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
    
    func getJuices() -> [JuicesName : JuicesType] {
        return recipe.getAllJuices()
    }
    
    func addStock(fruitType: FruitsType, stock: Int) throws {
        guard let fruit = fruits[fruitType] else {
            throw JuiceMakerError.notFound
        }
        
        fruit.addStock(stock)
    }
    
    func choiceJuice(juice: JuicesName) throws {
        let juiceRecipe = recipe.getJuiceRecipe(juice)
        
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
