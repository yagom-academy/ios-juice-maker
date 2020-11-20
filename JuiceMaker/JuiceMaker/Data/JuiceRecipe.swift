//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by Wonhee on 2020/11/19.
//

import Foundation

enum JuicesType {
    case single
    case multi
}

enum Juices {
    case strawberry(type: JuicesType, name: String)
    case banana(type: JuicesType, name: String)
    case kiwi(type: JuicesType, name: String)
    case pineapple(type: JuicesType, name: String)
    case mango(type: JuicesType, name: String)
    case strawberryBanana(type: JuicesType, name: String)
    case mangoKiwi(type: JuicesType, name: String)
    
    typealias JuiceInfo = (type: JuicesType, name: String)
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
