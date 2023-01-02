//  JuiceMaker - JuiceMaker.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

import Foundation

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(juice: JuiceMenu) {
        let recipe = juice.recipe
        
        for (fruit, num) in recipe {
            do {
                try fruitStore.checkFruit(fruit: fruit, number: num)
                fruitStore.decreaseFruit(fruit: fruit, number: num)
            } catch FruitStoreError.noExistInventory {
                print("해당 과일 존재하지 않음")
            } catch FruitStoreError.lackedInventory {
                print("\(fruit.name)과일 재고 부족")
            } catch {
                print(error)
            }
        }
    }
}
