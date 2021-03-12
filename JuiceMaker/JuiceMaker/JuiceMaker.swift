//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/11.
//

import Foundation

enum AppError:Error {
    case outOfStock
    case unknownError
}

enum Fruit {
    case strawberry, banana, kiwi, pineapple, mango
}
enum Juice {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
}

class JuiceMaker {
    var fruitStorage = FruitStorage.shared.refrigerator
    
    func increaseFruit(input: Fruit) throws {
        guard let stock = fruitStorage[input] else {
            throw AppError.unknownError
        }
        fruitStorage.updateValue(stock + 1, forKey: input)
    }
    
    func decreaseFruit(input: Fruit) throws {
        guard let stock = fruitStorage[input], stock > 0 else {
            throw AppError.unknownError
        }
        fruitStorage.updateValue(stock - 1, forKey: input)
    }
    
    func consumeFruit(input: Fruit, amount: Int) throws {
        guard let stock = fruitStorage[input] else {
            throw AppError.unknownError
        }
        fruitStorage.updateValue(stock + amount, forKey: input)
    }
    
    func makeJuice(input: Fruit, for juice: Juice) {
        do {
            _ = try isJuiceAvailable(fruit: input, for: juice)
            print("주스가 나왔습니다.")
            } catch {
            print("재고가 부족합니다.")
            }
    }
    func remainingFruits(fruit: Fruit) throws -> Int {
        guard let remainder = fruitStorage[fruit] else {
            throw AppError.unknownError
        }
        return remainder
    }
    
    func requiredFruitsForRecipe(juice: Juice, fruit: Fruit) throws -> Int {
        let needs = juiceRecipe(recipe: juice)
        guard let requirements = needs[fruit] else {
            throw AppError.unknownError
        }
        return requirements
    }
    
    func isJuiceAvailable(fruit: Fruit, for juice: Juice) throws -> Bool {
        let fruitsInStock = try remainingFruits(fruit: fruit)
        let requiredFruits = try requiredFruitsForRecipe(juice: juice, fruit: fruit)
        if fruitsInStock < requiredFruits {
            throw AppError.outOfStock
        }
        return true
    }
    func juiceRecipe(recipe: Juice) -> [Fruit: Int] {
        switch recipe {
        case .strawberryJuice:
            return [Fruit.strawberry: 16]
        case .bananaJuice:
            return [Fruit.banana: 2]
        case .kiwiJuice:
            return [Fruit.kiwi: 3]
        case .pineappleJuice:
            return [Fruit.pineapple: 2]
        case .mangoJuice:
            return [Fruit.mango: 3]
        case .strawberryBananaJuice:
            return [Fruit.strawberry: 10, Fruit.banana: 1]
        case .mangoKiwiJuice:
            return [Fruit.mango: 2, Fruit.kiwi: 1]
        }
    }
}


