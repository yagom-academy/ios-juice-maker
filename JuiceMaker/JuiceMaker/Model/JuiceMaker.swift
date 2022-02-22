//
//  JuiceMaker - JuiceMaker.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



// 쥬스 메이커 타입
struct JuiceMaker {
    private var myFruitStore: FruitStore = FruitStore()
    
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
    
    private func checkAllInventory(_ juice: Juice) -> Bool {
            let howMany = juice.recipe.count
            var isItOkay: [Bool] = []
            for index in Int.zero..<howMany {
                isItOkay.append(checkOneInventory(juice, index))
            }
            return isItOkay.allSatisfy{ $0 == true }
        }
    
    private func checkOneInventory(_ juice: Juice,_ numberOfFruitType: Int) -> Bool {
        let (fruit, neededNumber) = juice.recipe[numberOfFruitType]
        let stockNumber: Int = myFruitStore.inventory[fruit] ?? Int.zero
        
        if stockNumber >= neededNumber {
            return true
        } else {
            return false
        }
    }
    
    private func makeJuice(_ juice: Juice) {
            for index in Int.zero..<juice.recipe.count {
                let (needFruit, number) = juice.recipe[index]
                let nowInventory = myFruitStore.inventory[needFruit] ?? Int.zero
                myFruitStore.changeInventory(fruit: needFruit, fruitNumber: nowInventory - number)
                print("\(juice) 나왔습니다.")
                print(myFruitStore.inventory[needFruit])
            }
        }
}


