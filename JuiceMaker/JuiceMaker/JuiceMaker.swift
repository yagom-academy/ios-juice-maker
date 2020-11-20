//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: Int, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

// 과일 재고 관리 역할만
// - 수량 확인
// - 수량 설정
// - 수량 더하기
// - 수량 빼기
class FruitStorage {
    private var fruitStocks: [UInt] = Array(repeating: 0, count: Fruit.allCases.count)
   
    func countStock(of fruit: Fruit) -> UInt {
        return fruitStocks[fruit.rawValue]
    }
    
    func setStock(of fruit: Fruit, count: UInt) {
        fruitStocks[fruit.rawValue] = count
    }
    
    func addStock(of fruit: Fruit, count: UInt) {
        fruitStocks[fruit.rawValue] += count
    }
    
    func subtractStock(of fruit: Fruit, count: UInt) {
        fruitStocks[fruit.rawValue] -= count
    }
}

struct JuiceRecipe {
    let list: [Fruit: UInt]
}

// 쥬스 레시피의 프로퍼티는 인스턴스내에서 변경되지 않으므로 struct로 선언
struct JuiceRecipes {
    let list: [Juice:JuiceRecipe]
    
    func getRecipe(of juice: Juice) -> JuiceRecipe? {
        return list[juice]
    }
}

// 야곰의 쥬스 레시피 상수
let yagomsJuiceRecipes: JuiceRecipes = JuiceRecipes(list: [
    .strawberryJuice:JuiceRecipe(list: [.strawberry:16]),
    .bananaJuice:JuiceRecipe(list: [.banana:2]),
    .kiwiJuice:JuiceRecipe(list: [.kiwi:3]),
    .pineappleJuice:JuiceRecipe(list: [.pineapple:2]),
    .strawberryBananaJuice:JuiceRecipe(list: [.strawberry:10, .banana:1]),
    .mangoJuice:JuiceRecipe(list: [.mango:3]),
    .mangoKiwiJuice:JuiceRecipe(list: [.mango:2, .kiwi:1])
])
                                            
enum JuiceMakerError: Error {
    case lowStock
    case noRecipe
    case noStockList
}

// 쥬스 제작 역할만
// - 쥬스종류에 따라 제작
class JuiceMaker {
    // 과일창고와 레시피는 변경할 수 있도록 var로 선언
    var fruitStorage: FruitStorage
    var juiceRecipes: JuiceRecipes
    
    init(fruitStorage: FruitStorage, juiceRecipes: JuiceRecipes) {
        self.fruitStorage = fruitStorage
        self.juiceRecipes = juiceRecipes
    }
    
    private func isEnoughStock(of juiceRecipe: JuiceRecipe) -> Bool {
        for (fruit, count) in juiceRecipe.list {
            let currentCount = fruitStorage.countStock(of: fruit)

            guard currentCount >= count else {
                return false
            }
        }
        
        return true
    }
    
    private func consumeStock(of juiceRecipe: JuiceRecipe) {
        for (fruit, count) in juiceRecipe.list {
            fruitStorage.subtractStock(of: fruit, count: count)
        }
    }
        
    func make(juice: Juice) throws {
        guard let recipe = juiceRecipes.getRecipe(of: juice) else {
            throw JuiceMakerError.noRecipe
        }
        
        guard isEnoughStock(of: recipe) else {
            throw JuiceMakerError.lowStock
        }

        consumeStock(of: recipe)
    }
}
