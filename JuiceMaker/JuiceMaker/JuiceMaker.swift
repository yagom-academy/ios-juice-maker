//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class Fruit {
    private (set) var stock: Int = 10
    
    func addStock(quantity: Int) {
        self.stock += quantity
    }
    
    func subtractStock(quantity: Int) {
        self.stock -= quantity
    }
    
    func nowStock() -> Int {
        return self.stock
    }
    
    func checkStock(requiredQuantity: Int) -> Bool {
        if requiredQuantity <= nowStock() {
            return true
        }
        
        return false
    }
}

class FruitStock {
    static let strawberry = Fruit()
    static let banana = Fruit()
    static let pineapple = Fruit()
    static let kiwi = Fruit()
    static let mango = Fruit()
}

class Juice {
    typealias NeedStock = Int
    let recipe: [(Fruit,NeedStock)]
    let name: String
    
    init(createRecipe: [(Fruit, NeedStock)], createName: String) {
        self.recipe = createRecipe
        self.name = createName
    }
}

class JuiceRecipe {
    static let strawberryJuice = Juice(
        createRecipe: [(FruitStock.strawberry, 16)], createName: "딸기쥬스")
    static let bananaJuice = Juice(
        createRecipe: [(FruitStock.banana, 2)], createName: "바나나쥬스")
    static let pineappleJuice = Juice(
        createRecipe: [(FruitStock.pineapple, 2)], createName: "파인애플쥬스")
    static let kiwiJuice = Juice(
        createRecipe: [(FruitStock.kiwi, 3)], createName: "키위쥬스")
    static let mangoJuice = Juice(
        createRecipe: [(FruitStock.mango, 3)], createName: "망고쥬스")
    static let strawbaJuice = Juice(
        createRecipe: [(FruitStock.strawberry, 10), (FruitStock.banana, 1)], createName: "딸바쥬스")
    static let mangkiJuice = Juice(
        createRecipe: [(FruitStock.mango, 1), (FruitStock.kiwi, 2)], createName: "망키쥬스")
}

class JuiceMaker {
    let stocks: FruitStock = FruitStock()
    let juiceRecipe: JuiceRecipe = JuiceRecipe()
    
    func makeJuice(juiceName: Juice) -> String {
        var result: String = "존재하지 않는 레시피입니다"

        if compareStockToRecipe(juiceName) {
            for (fruit, needstock) in juiceName.recipe {
                fruit.subtractStock(quantity: needstock)
            }
            
            result = "\(juiceName.name)가 완성되었습니다! 맛있게 드세요"
        } else {
            result = "재고가 부족합니다. 재고를 수정할까요?"
        }
        
        return result
    }
    
    func compareStockToRecipe(_ juiceName: Juice) -> Bool {
        var result: Bool = false
        
        for (fruit, needstock) in juiceName.recipe {
            result = fruit.checkStock(requiredQuantity: needstock)
            
            if !result {
                break
            }
        }
        
        return result
    }
}


