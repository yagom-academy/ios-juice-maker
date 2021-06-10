//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    enum JuiceMenu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case mangoJuice
        case pineappleJuice
        case strawNanaJuice
        case mangoKiwiJuice
        
        var recipe:[(Fruit ,Int)] {
            switch self {
            case .strawberryJuice:
                return [(.strawberry, 16)]
            case .bananaJuice:
                return [(.banana, 2)]
            case .kiwiJuice:
                return [(.kiwi, 3)]
            case .mangoJuice:
                return [(.mango, 3)]
            case .pineappleJuice:
                return [(.pineapple, 2)]
            case .strawNanaJuice:
                return [(.strawberry, 10), (.banana, 1)]
            case .mangoKiwiJuice:
                return [(.mango, 2), (.kiwi, 1)]
            }
        }
    }
    
    enum Fruit: String, CaseIterable {
        case strawberry = "딸기"
        case banana = "바나나"
        case kiwi = "키위"
        case mango = "망고"
        case pineapple = "파인애플"
    }
    
    let fruitStores =  [FruitStore]()
    
    init(){
        for fruit in Fruit.allCases {
            fruitStores.append(FruitStore(storeName: fruit.rawValue))
        }
    }
    
    func checkJuiceMakable(targetStore: FruitStore, amount: Int) -> Bool {
        if targetStore.stock >= amount {
            return true
        } else {
            return false
        }
    }
    
    func makeJuice(wanted: JuiceMenu){
        let recipes = wanted.recipe
        var makable = true
        for (fruit, amount) in recipes {
            if let store = fruitStores.first(where: { store in store.name == fruit.rawValue}) {
                
                let haveStock = checkJuiceMakable(targetStore: store, amount: amount)
                
                if !haveStock {
                    makable = false
                    break
                }
            }
        }
    }
    
}

