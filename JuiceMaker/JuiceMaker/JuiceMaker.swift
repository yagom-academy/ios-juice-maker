//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

enum FruitName: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case kiwi = "키위"
    case mango = "망고"
    case pineapple = "파인애플"
    
    func number() -> Int {
        switch self {
        case .strawberry:
            return 0
        case .banana:
            return 1
        case .kiwi:
            return 2
        case .mango:
            return 3
        case .pineapple:
            return 4
        }
    }
}

enum RecipeName: String {
    case strawberryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case kiwiJuice = "키위 쥬스"
    case mangoJuice = "망고 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case strawberryBananaJuice = "딸기바나나 쥬스"
    case kiwiMangoJuice = "키위망고 쥬스"
    
    func number() -> Int {
        switch self {
        case .strawberryJuice:
            return 0
        case .bananaJuice:
            return 1
        case .kiwiJuice:
            return 2
        case .mangoJuice:
            return 3
        case .pineappleJuice:
            return 4
        case .strawberryBananaJuice:
            return 5
        case .kiwiMangoJuice:
            return 6
        }
    }
}

struct Fruit {
    let name: FruitName
    private(set) var amount: Int
    
    init(name: FruitName, amount: Int = 10) {
        self.name = name
        self.amount = amount
    }
    
    mutating func supply(amount: Int) {
        self.amount += amount
    }
    
    mutating func use(amount: Int) {
        self.amount -= amount
    }
    
    mutating func compareStock(with need: Int) -> Bool {
        return self.amount >= need
    }
}

struct Recipe {
    let name: RecipeName
    let neededFruits: [NeededFruit]
    
    init(recipeName: RecipeName, neededFruits : [NeededFruit]) {
        self.name = recipeName
        self.neededFruits = neededFruits
    }
}

struct NeededFruit {
    let name: FruitName
    let amount: Int
    
    init(fruitName: FruitName, amount: Int) {
        self.name = fruitName
        self.amount = amount
    }
}


class JuiceMaker {
    var fruitList: [Fruit] = []
    var recipeList: [Recipe] = []
    
    init() {
        fruitList.append(Fruit(name: .strawberry))
        fruitList.append(Fruit(name: .banana))
        fruitList.append(Fruit(name: .kiwi))
        fruitList.append(Fruit(name: .mango))
        fruitList.append(Fruit(name: .pineapple))
        
        recipeList.append(Recipe(recipeName: .strawberryJuice,
                                 neededFruits: [NeededFruit(fruitName: .strawberry, amount: 16)]))
        recipeList.append(Recipe(recipeName: .bananaJuice,
                                 neededFruits: [NeededFruit(fruitName: .banana, amount: 2)]))
        recipeList.append(Recipe(recipeName: .kiwiJuice,
                                 neededFruits: [NeededFruit(fruitName: .kiwi, amount: 3)]))
        recipeList.append(Recipe(recipeName: .pineappleJuice,
                                 neededFruits: [NeededFruit(fruitName: .pineapple, amount: 2)]))
        recipeList.append(Recipe(recipeName: .mangoJuice,
                                 neededFruits: [NeededFruit(fruitName: .mango, amount: 3)]))
        recipeList.append(Recipe(recipeName: .strawberryBananaJuice,
                                 neededFruits: [NeededFruit(fruitName: .strawberry, amount: 10),
                                                NeededFruit(fruitName: .banana, amount: 1)]))
        recipeList.append(Recipe(recipeName: .kiwiMangoJuice,
                                 neededFruits: [NeededFruit(fruitName: .kiwi, amount: 1),
                                                NeededFruit(fruitName: .mango, amount: 2)]))
    }
    
    func makeJuice(recipe: RecipeName) {
        // 재고 확인
        for neededFruit in recipeList[recipe.number()].neededFruits {
            guard fruitList[neededFruit.name.number()].compareStock(with: neededFruit.amount) else {
                debugPrint("\(neededFruit.name.rawValue) 재고 부족")
                return
            }
        }
        // 제조
        for neededFruit in recipeList[recipe.number()].neededFruits {
            fruitList[neededFruit.name.number()].use(amount: neededFruit.amount)
        }
        debugPrint("\(recipe.rawValue) 완성")
    }
}


