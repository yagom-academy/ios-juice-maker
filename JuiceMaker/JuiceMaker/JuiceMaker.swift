//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

protocol MakerRecipe {
    associatedtype Juice: MakerJuice
}

protocol MakerJuice {
    var description: String { get }
    var ingredients: [Fruit: Int] { get }
}

class YagomRecipe: MakerRecipe {
    enum Juice: MakerJuice {
        case strawbana, mangki, strawberry, banana, pineapple, kiwi, mango
        
        var description: String {
            switch self {
            case .strawbana: return "딸바쥬스"
            case .mangki: return "망키쥬스"
            case .strawberry: return "딸기쥬스"
            case .banana: return "바나나쥬스"
            case .pineapple: return "파인애플쥬스"
            case .kiwi: return "키위쥬스"
            case .mango: return "망고쥬스"
            }
        }
        
        var ingredients: [Fruit: Int] {
            switch self {
            case .strawbana: return [.strawberry: 10, .banana: 1]
            case .mangki: return [.mango: 2, .kiwi: 1]
            case .strawberry: return [.strawberry: 16]
            case .banana: return [.banana: 2]
            case .pineapple: return [.pineapple: 2]
            case .kiwi: return [.kiwi: 3]
            case .mango: return [.mango: 3]
            }
        }
    }
}

class ZziruruRecipe: MakerRecipe {
    enum Juice: MakerJuice {
        case strawki, pinebana, strawberry, banana, pineapple, kiwi, mango
        
        var description: String {
            switch self {
            case .strawki: return "딸키쥬스"
            case .pinebana: return "파바쥬스"
            case .strawberry: return "딸기쥬스"
            case .banana: return "바나나쥬스"
            case .pineapple: return "파인애플쥬스"
            case .kiwi: return "키위쥬스"
            case .mango: return "망고쥬스"
            }
        }
        
        var ingredients: [Fruit: Int] {
            switch self {
            case .strawki: return [.strawberry: 8, .kiwi: 2]
            case .pinebana: return [.pineapple: 2, .banana: 1]
            case .strawberry: return [.strawberry: 10]
            case .banana: return [.banana: 1]
            case .pineapple: return [.pineapple: 1]
            case .kiwi: return [.kiwi: 2]
            case .mango: return [.mango: 2]
            }
        }
    }
}

class JuiceMaker<T: MakerRecipe> {
    private var stock: [Fruit: Int] = [:]
    private var recipe: T
    
    init(stockCount: Int, recipe: T) {
        for fruit in Fruit.allCases {
            stock[fruit] = stockCount
        }
        self.recipe = recipe
    }
    
    func make(juice: T.Juice) {
        if isEnough(ingredients: juice.ingredients) {
            for (fruit, count) in juice.ingredients {
                guard let stockCount = stock[fruit] else { return }
                stock[fruit] = stockCount - count
            }
            print("\(juice.description) 나왔습니다! 맛있게 드세요!")
        } else {
            print("재료가 모자랍니다.")
        }
    }
    
    func fillUpStock(of fruit: Fruit, count: Int) {
        guard let stockCount = stock[fruit] else {
            print("재고 목록에 없는 과일입니다")
            return
        }
        stock[fruit] = stockCount + count
    }
    
    func stock(of fruit: Fruit) -> Int? {
        return stock[fruit]
    }
    
    private func isEnough(ingredients: [Fruit: Int]) -> Bool {
        for (fruit, count) in ingredients {
            guard let stock = stock(of: fruit) else { return false }
            if stock < count { return false }
        }
        
        return true
    }
}

let maker = JuiceMaker(stockCount: 10, recipe: YagomRecipe())
