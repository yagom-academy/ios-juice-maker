//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitstore = FruitStore()

    enum Juice {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberrybanana
        case mango
        case mangokiwi

        fileprivate var recipe : [FruitStore.Fruit:Int] {
            switch self {
            case .strawberry: return [.strawberry: 16]
            case .banana: return [.banana: 2]
            case .kiwi: return [.pineapple: 2]
            case .pineapple: return [.kiwi: 3]
            case .strawberrybanana: return [.strawberry: 10, .banana: 1]
            case .mango: return [.mango: 3]
            case .mangokiwi: return [.mango: 2,.kiwi: 1]
            }
        }
    }

    private func checkStock(juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitstore.checkEnoughFruit(which: fruit, on: amount)
        }
        
    }

    private func makeJuice(juice: Juice) {
        do {
            try checkStock(juice: juice)
        } catch let error as Errors {
            print(error.errorDescription)
        } catch {
            print(error)
        }
    }
}


