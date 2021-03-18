//
//  FruitStorage.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/12.
//

import Foundation

class FruitStorage {
    static let shared = FruitStorage()
    private(set) var refrigerator: [Fruit: Int]
    
    private init() {
        refrigerator = [Fruit.strawberry: 10, Fruit.banana:10, Fruit.kiwi: 10, Fruit.mango: 10, Fruit.pineapple: 10]
    }
    
    private func setInitialFruitAmount(input: Int) {
        for (fruit, _) in refrigerator {
            refrigerator.updateValue(input, forKey: fruit)
        }
    }
    
    func increaseStock(of fruit: Fruit, by quantity: Int) throws {
        guard let stock = refrigerator[fruit] else {
            throw JuiceMakerError.outOfStock
        }
        if quantity >= 0 {
            refrigerator.updateValue(stock + quantity, forKey: fruit)
        }
    }
    
    func decreaseStock(of fruit: Fruit, by quantity: Int) throws {
        guard let stock = refrigerator[fruit], stock >= quantity else {
            throw JuiceMakerError.outOfStock
        }
        if quantity >= 0 {
            refrigerator.updateValue(stock - quantity, forKey: fruit)
        }
    }
    
    func manageFruit(juice: Juice) throws {
        for (fruit, requirements) in juice.recipe {
            guard let stock = refrigerator[fruit] else {
                throw JuiceMakerError.invalidAccess
            }
            if stock >= requirements {
                refrigerator.updateValue(stock - requirements, forKey: fruit)
            }
            else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
