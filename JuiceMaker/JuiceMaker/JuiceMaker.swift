//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum printMessege: String {
    case unknownError = "알 수 없는 에러입니다."
    case nonExistentRecipe = "존재하지 않는 레시피 입니다."
    case notEnoughStock = "재고가 부족합니다."
    case completeMakeJuice = "쥬스가 완성되었습니다."
}

enum Juice {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice,
         strawbaJuice, mangkiJuice
}

class JuiceMaker {
    // Array Index -> strawberry = 0, banana = 1, pineapple = 2, kiwi = 3, mango = 4
    private var stock: [Int] = [10, 10, 10, 10, 10]
    var messeges: printMessege = .unknownError
    
    func nowStock(index: Int) -> Int {
        return stock[index]
    }
    
    func useStock(index: Int, amount: Int) {
        self.stock[index] -= amount
    }
    
    func addStock(index: Int, amount: Int) {
        self.stock[index] += amount
    }
    
    
    func checkCompareAmountToStock(juiceMenu: Juice) -> Bool {
        var result: Bool = false
        let recipe = matchJuiceRecipe(targetJuice: juiceMenu)
        
        for (target, compareAmount) in recipe {
            if stock[target] < compareAmount {
                result = false
                break
            } else {
                result = true
            }
        }
        
        return result
    }
    
    func matchJuiceRecipe(targetJuice: Juice) -> [Int: Int] {
        var recipe: [Int: Int] = [:]
        
        //  recipe = [Key: Value] -> [stock Array index : recipe need amount]
        switch targetJuice {
        case .strawberryJuice:
            recipe = [0:16]
        case .bananaJuice:
            recipe = [1:2]
        case .pineappleJuice:
            recipe = [2:2]
        case .kiwiJuice:
            recipe = [3:3]
        case .mangoJuice:
            recipe = [4:3]
        case .strawbaJuice:
            recipe = [0:10, 1:1]
        case .mangkiJuice:
            recipe = [3:1, 4:2]
        default:
            messeges = .nonExistentRecipe
        }
        
        return recipe
    }
    
    func makeJuice(juiceName: Juice) {
        let recipe = matchJuiceRecipe(targetJuice: juiceName)
        let checkStockStatus: Bool = checkCompareAmountToStock(juiceMenu: juiceName )
        
        if checkStockStatus {
            for (key, value) in recipe {
                useStock(index: key, amount: value)
            }
            messeges = .completeMakeJuice
        } else {
            messeges = .notEnoughStock
        }
    }
}
