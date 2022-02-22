//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



// 쥬스 메이커 타입
struct JuiceMaker {
    var myFruitStore: FruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryAndBananaJuice
        case mangoAndKiwiJuice
        
        var recipe: [(FruitStore.Fruit, Int)] {
            switch self {
            case .strawberryJuice:
                return [(FruitStore.Fruit.strawberry, 16)]
            case .bananaJuice:
                return [(FruitStore.Fruit.banana, 2)]
            case .pineappleJuice:
                return [(FruitStore.Fruit.pineapple, 2)]
            case .kiwiJuice:
                return [(FruitStore.Fruit.kiwi, 3)]
            case .mangoJuice:
                return [(FruitStore.Fruit.mango, 3)]
            case .strawberryAndBananaJuice:
                return [(FruitStore.Fruit.strawberry, 10), (FruitStore.Fruit.banana, 1)]
            case .mangoAndKiwiJuice:
                return [(FruitStore.Fruit.mango, 2), (FruitStore.Fruit.kiwi, 1)]
                
            }
        }
    }
    
    func orderJuice(_ juice: Juice) {
        if checkAllInventory(juice) {
            makeJuice(juice)
        } else {
            print("과일의 재고가 부족합니다.")
        }
    }
    
    func checkAllInventory(_ juice: Juice) -> Bool {
            let howMany = juice.recipe.count
            var isItOkay: [Bool] = []
            for index in 0...howMany - 1{
                isItOkay.append(checkOneInventory(juice, index))
            }
            return isItOkay.allSatisfy{ $0 == true }
        }
    
    func checkOneInventory(_ juice: Juice,_ numberOfFruitType: Int) -> Bool {
        let (fruit, neededNumber) = juice.recipe[numberOfFruitType]
        let stockNumber: Int = myFruitStore.inventory[fruit] ?? 0
        
        if stockNumber >= neededNumber {
            return true
        } else {
            return false
        }
    }
    
    func makeJuice(_ juice: Juice) {
        for index in 0..<juice.recipe.count {
            let (needFruit, number) = juice.recipe[index]
            guard let nowInventory = myFruitStore.inventory[needFruit] else { return }
            myFruitStore.inventory.updateValue(nowInventory - number, forKey: needFruit)
        }
    }
}


