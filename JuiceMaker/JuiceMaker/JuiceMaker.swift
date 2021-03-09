//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum MakerError: Error {
    case nonStock
    case unknown
}
enum Furits {
    case strawberry, banana, pineapple, kiwi, mango
}
enum Juices {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
    
    var recipe : [Furits : Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .mangoJuice:
            return [.mango : 3]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
        }
    }
}

struct Fruit {
    let whatFruit: Furits
    fileprivate var thisFruitAmount: Int
    init(whatFruit: Furits, thisFruitAmount: Int = 100) {
        self.whatFruit = whatFruit
        self.thisFruitAmount = thisFruitAmount
    }
    
    func isCheckedStock(needFruitAmount: Int) -> Bool {
        return thisFruitAmount >= needFruitAmount
    }
    mutating func useStock(useableFruitAmount: Int) {
        thisFruitAmount -= useableFruitAmount
    }
    mutating func addStock() {
        thisFruitAmount += 1
    }
}

protocol ReadOnlyJuiceMaker {
    var fruitStorage: [Furits:Fruit] { get }
}

class JuiceMaker: ReadOnlyJuiceMaker {
    var fruitStorage: [Furits : Fruit] = [.strawberry : Fruit(whatFruit: .strawberry),
                                          .banana : Fruit(whatFruit: .banana),
                                          .pineapple : Fruit(whatFruit: .pineapple),
                                          .kiwi : Fruit(whatFruit: .kiwi),
                                          .mango : Fruit(whatFruit: .mango)]
    
    func makeJuice(juice: Juices) throws {
        do {
            try juice.recipe.forEach {
                guard var whatFruit = fruitStorage[$0.key], whatFruit.isCheckedStock(needFruitAmount: $0.value) else {
                    throw MakerError.nonStock
                }
                whatFruit.useStock(useableFruitAmount: $0.value)
            }
        } catch {
            print("\(juice) 재고 부족")
        }
    }
    func totalStock() -> [Furits:Fruit] {
        return fruitStorage
    }
    func fruitStock(fruit: Furits) throws -> Int {
        guard let fruitStock = fruitStorage[fruit] else {
            throw MakerError.nonStock
        }
        return fruitStock.thisFruitAmount
    }
}
