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
    case single
    case multi
}

typealias JuiceInfo = (type: JuicesType, name: String)

enum Juices {
    case strawberry(type: JuicesType, name: String)
    case banana(type: JuicesType, name: String)
    case kiwi(type: JuicesType, name: String)
    case pineapple(type: JuicesType, name: String)
    case mango(type: JuicesType, name: String)
    case strawberryBanana(type: JuicesType, name: String)
    case mangoKiwi(type: JuicesType, name: String)
    
    func getJuiceInfo() -> JuiceInfo {
        switch self {
        case let .strawberry(type, name):
            return (type, name)
        case let .banana(type, name):
            return (type, name)
        case let .kiwi(type, name):
            return (type, name)
        case let .pineapple(type, name):
            return (type, name)
        case let .mango(type, name):
            return (type, name)
        case let .strawberryBanana(type, name):
            return (type, name)
        case let .mangoKiwi(type, name):
            return (type, name)
        }
    }
}

struct JuiceRecipe {
    typealias Recipe = [FruitsType : Int]
    
    let juices: [Juices] = [
        .strawberry(type: .single, name: "딸기주스"),
        .banana(type: .single, name: "바나나주스"),
        .kiwi(type: .single, name: "키위주스"),
        .pineapple(type: .single, name: "파인애플주스"),
        .mango(type: .single, name: "망고주스"),
        .strawberryBanana(type: .multi, name: "딸바주스"),
        .mangoKiwi(type: .multi, name: "망키주스")
    ]
    
    private let strawberry: [FruitsType : Int] = [.strawberry : 16]
    private let banana: [FruitsType : Int] = [.banana : 2]
    private let kiwi: [FruitsType : Int] = [.kiwi : 3]
    private let pineapple: [FruitsType : Int] = [.pineapple : 2]
    private let mango: [FruitsType : Int] = [.mango : 3]
    private let strawberryBanana: [FruitsType : Int] = [.strawberry : 10, .banana : 1]
    private let mangoKiwi: [FruitsType : Int] = [.mango : 2, .kiwi : 1]
    
    func getJuiceRecipe(_ juiceType: Juices) -> Recipe {
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
    
    func getJuices() -> [Juices] {
        return recipe.juices
    }
    
    func addStock(fruitType: FruitsType, stock: Int) throws {
        guard let fruit = fruits[fruitType] else {
            throw JuiceMakerError.notFound
        }
        
        fruit.addStock(stock)
    }
    
    func choiceJuice(juice: Juices) throws {
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
