// FruitStore.swift
// Created by Quokka, Donnie

import Foundation
import UIKit

class FruitStore {
    enum Fruit: Int, CaseIterable {
        case strawberry = 1
        case banana
        case pineapple
        case kiwi
        case mango
    }
    private var fruitsStock: [Fruit: Int] = [:]
     
    init(defaultCount: Int = 10) {
        Fruit.allCases.forEach { (fruit: Fruit) in
            fruitsStock[fruit] = defaultCount
        }
    }
    
    func makeReady(for juice: Juice) throws {
        for fruit in juice.recipe.keys {
            try checkEnoughStock(for: juice, fruit: fruit)
        }
    }
    
    private func checkEnoughStock(for juice: Juice, fruit: Fruit) throws {
        guard let currentFruitQuantity = fruitsStock[fruit],
              let needFruitQuantity = juice.recipe[fruit],
              currentFruitQuantity >= needFruitQuantity else {
                  throw JuiceError.notEnoughStock
              }
    }
    
    func changeFruitQuantity(by fruit: Fruit, count: Int) {
        if let currentFruitQuantity = fruitsStock[fruit] {
            fruitsStock.updateValue(currentFruitQuantity - count, forKey: fruit)
        }
    }
    
    func bringStockValue(for fruit: Fruit) -> String {
        guard let fruitStock = fruitsStock[fruit] else { return "" }
        return "\(fruitStock)"
    }
    
    func updateStock(_ fruitStockLabels: [UILabel]!) {
        for index in fruitStockLabels.indices {
            guard let fruit = Fruit(rawValue: fruitStockLabels[index].tag),
                  let fruitCountText = fruitStockLabels[index].text,
                  let fruitCount = Int(fruitCountText) else { return }
            fruitsStock[fruit] = fruitCount
        }
    }
}
