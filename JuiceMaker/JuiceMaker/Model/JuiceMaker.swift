//
//  JuiceMaker - JuiceMaker.swift
//  Created by mireu,charles
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private var fruitStore = FruitStore(fruitStock: [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
    
    private mutating func subtractFruitStock(juice: Juice) throws {
        for (name, count) in juice.recipe {
            try fruitStore.subtractFruitStock(name: name, count: count)
        }
    }
    
    mutating func makeJuice(juice: Juice) throws {
        switch juice {
        case .strawberryJuice:
            do {
                try subtractFruitStock(juice: .strawberryJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        case .bananaJuice:
            do {
                try subtractFruitStock(juice: .bananaJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        case .kiwiJuice:
            do {
                try  subtractFruitStock(juice: .kiwiJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        case .pineappleJuice:
            do {
                try subtractFruitStock(juice: .pineappleJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        case .strawberryBananaJuice:
            do {
                try  subtractFruitStock(juice: .strawberryBananaJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        case .mangoJuice:
            do {
                try  subtractFruitStock(juice: .mangoJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        case .mangoKiwiJuice:
            do {
                try subtractFruitStock(juice: .mangoKiwiJuice)
            } catch {
                print(FruitStoreError.outOfStock)
            }
        }
    }
}
