//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case mangoJuice
        case ddalbaJuice
        case mangKiJuice
        
        enum FruitQuintity {
            static let strawberryOfStrawberrJuice = 16
            static let bananaOfBananaJuice = 2
            static let kiwiOfKiwiJuice = 3
            static let pineappleOfPineappleJuice = 2
            static let mangoOfMangoJuice = 3
            static let strawberryOfDdalbaJuice = 10
            static let bananaOfDdalbaJuice = 1
            static let mangoOfMangKiJuice = 2
            static let KiwiOfMangKiJuice = 1
        }
        
        var ingredients: [Fruit] {
            switch self {
            case .strawberryJuice:
                return [Fruit(name: .strawberry,
                              quantity: Menu.FruitQuintity.strawberryOfStrawberrJuice)]
            case .bananaJuice:
                return [Fruit(name: .banana,
                              quantity: Menu.FruitQuintity.bananaOfBananaJuice)]
            case .kiwiJuice:
                return [Fruit(name: .kiwi,
                              quantity: Menu.FruitQuintity.kiwiOfKiwiJuice)]
            case .pineappleJuice:
                return [Fruit(name: .pineapple,
                              quantity: Menu.FruitQuintity.pineappleOfPineappleJuice)]
            case .mangoJuice:
                return [Fruit(name: .mango,
                              quantity: Menu.FruitQuintity.mangoOfMangoJuice)]
            case .ddalbaJuice:
                return [Fruit(name: .strawberry,
                              quantity: Menu.FruitQuintity.strawberryOfDdalbaJuice),
                        Fruit(name: .banana,
                              quantity: Menu.FruitQuintity.bananaOfDdalbaJuice)]
            case .mangKiJuice:
                return [Fruit(name: .mango,
                              quantity: Menu.FruitQuintity.mangoOfMangKiJuice),
                        Fruit(name: .kiwi,
                              quantity: Menu.FruitQuintity.KiwiOfMangKiJuice)]
            }
        }
    }
    
    enum Message: CustomStringConvertible {
        var description: String {
            switch self {
            case .makeSuccessMessage:
                return "쥬스 나왔습니다! 맛있게 드세요!"
            case .makeFailMessage:
                return "재료가 모자라요. 재고를 수정할까요?"
            case .updateFailMessage:
                return "재고변경을 실해하였습니다."
            }
        }
        
        case makeSuccessMessage
        case makeFailMessage
        case updateFailMessage
    }
    
    private let fruitStore: FruitStore = FruitStore()
    
    func make(juice: Menu) -> String {
        var isSuccess: Bool = false
        
        for juice in juice.ingredients {
            isSuccess = fruitStore.bring(requiredIngredients: juice)
        }
        
        if isSuccess == true {
            return Message.makeSuccessMessage.description
        } else {
            return Message.makeFailMessage.description
        }
    }
    
    func updateStore(to requiredChange: Fruit) -> Bool {
        guard fruitStore.updateQuantity(to: requiredChange) else {
            print(Message.updateFailMessage.description)
            return false
        }
        
        return true
    }
}

