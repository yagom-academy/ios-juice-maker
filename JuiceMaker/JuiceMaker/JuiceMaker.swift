//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juice: String {
    case strawbana = "딸바"
    case mangki = "망키"
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

class Stock {
    var fruit: Fruit
    var count: Int
    
    init(fruit: Fruit, count: Int) {
        self.fruit = fruit
        self.count = count
    }
}

struct Recipe {
    let juice: Juice
    let ingredients: [Fruit : Int]
}

class JuiceMaker {
    var stock: [Stock] = []
    let recipes: [Recipe] = [
        Recipe(juice: .strawbana, ingredients: [.strawberry: 10, .banana: 1]),
        Recipe(juice: .mangki, ingredients: [.mango: 2, .kiwi: 1]),
        Recipe(juice: .strawberry, ingredients: [.strawberry: 16]),
        Recipe(juice: .banana, ingredients: [.banana: 2]),
        Recipe(juice: .pineapple, ingredients: [.pineapple: 2]),
        Recipe(juice: .kiwi, ingredients: [.kiwi: 3]),
        Recipe(juice: .mango, ingredients: [.mango: 3]),
    ]
    
    init(stockCount: Int) {
        for fruit in Fruit.allCases {
            stock.append(Stock(fruit: fruit, count: stockCount))
        }
    }
    
    func make(juice: Juice) {
        guard let targetRecipe = recipes.first(where: { $0.juice == juice } ) else {
            print("만들 수 없는 쥬스입니다.")
            return
        }
        
        if canMake(recipe: targetRecipe) {
            for (fruit, count) in targetRecipe.ingredients {
                guard let target = stock.first(where: { $0.fruit == fruit } ) else { return }
                target.count -= count
            }
            print("\(juice.rawValue) 쥬스 나왔습니다! 맛있게 드세요!")
        } else {
            print("재료가 모자랍니다.")
        }
    }
    
    func fillUpStock(of fruit: Fruit, count: Int) {
        guard let target = stock.first(where: { $0.fruit == fruit } ) else {
            print("재고 목록에 없는 과일입니다")
            return
        }
        target.count += count
    }
    
    func checkStock(of fruit: Fruit) -> Int {
        return stock.first(where: { $0.fruit == fruit } )?.count ?? 0
    }
    
    private func canMake(recipe: Recipe) -> Bool {
        for (fruit, count) in recipe.ingredients {
            if checkStock(of: fruit) < count { return false }
        }
        
        return true
    }
}

let maker = JuiceMaker(stockCount: 10)
