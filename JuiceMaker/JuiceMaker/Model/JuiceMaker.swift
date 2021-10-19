//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Juice {
    var name: JuiceName
    var count: Int = 0
    
    enum JuiceName {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    
    enum JuiceMakerError: LocalizedError {
        case inValidMenuChoice
        
        var description: String {
            switch self {
            case .inValidMenuChoice:
                return "메뉴에 없습니다. 다시 선택해주세요."
            }
        }
    }
    
    var store = FruitStore()
    
    typealias ingredient = (fruit: Fruit.FruitName, count: Int)
    
    let strawberryJuiceRecipe: [ingredient] = [(.strawberry, 16)]
    let bananaJuiceRecipe: [ingredient] = [(.banana, 2)]
    let kiwiJuiceRecipe: [ingredient] = [(.kiwi, 3)]
    let pineappleJuiceRecipe: [ingredient] = [(.pineapple, 2)]
    let strawberryBananaJuiceRecipe: [ingredient] = [(.strawberry, 10), (.banana, 1)]
    let mangoJuiceRecipe: [ingredient] = [(.mango, 3)]
    let mangoKiwiJuiceRecipe: [ingredient] = [(.mango, 2), (.kiwi, 1)]
    
    lazy var recipe: [Juice.JuiceName: [ingredient]] = [
        .strawberryJuice: strawberryJuiceRecipe,
        .bananaJuice: bananaJuiceRecipe,
        .kiwiJuice: kiwiJuiceRecipe,
        .pineappleJuice: pineappleJuiceRecipe,
        .strawberryBananaJuice: strawberryBananaJuiceRecipe,
        .mangoJuice: mangoJuiceRecipe,
        .mangoKiwiJuice: mangoKiwiJuiceRecipe
    ]
    
    mutating func findRecipe(of juiceName: Juice.JuiceName) throws -> [ingredient] {
        guard let foundRecipe = recipe[juiceName] else {
            throw JuiceMakerError.inValidMenuChoice
        }
        return foundRecipe
    }
    
    func blendIngredient(by recipe: [ingredient]) {
        for ingredient in recipe {
            store.subtractStock(count: ingredient.count, from: ingredient.fruit)
        }
    }
    
    mutating func make(juiceName: Juice.JuiceName) {
        do {
            let foundRecipe = try findRecipe(of: juiceName)
            blendIngredient(by: foundRecipe)
        } catch JuiceMakerError.inValidMenuChoice {
            print(JuiceMakerError.inValidMenuChoice.description)
        } catch {
            print(error)
        }
    }
}
