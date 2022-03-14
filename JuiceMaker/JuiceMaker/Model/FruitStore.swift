// FruitStore.swift
// Created by Quokka, Donnie

import Foundation

class FruitStore {
    enum Fruit: Int, CaseIterable {
        case strawberry = 0
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
    
    private func checkEnoughStock(for juice: Juice, fruit: Fruit) throws {
        guard let currentFruitQuantity = fruitsStock[fruit],
              let needFruitQuantity = juice.recipe[fruit],
              currentFruitQuantity >= needFruitQuantity else {
                  throw JuiceError.notEnoughStock
              }
    }
    
    func makeReady(for juice: Juice) throws {
        for fruit in juice.recipe.keys {
            try checkEnoughStock(for: juice, fruit: fruit)
        }
    }
    
    func changeFruitQuantity(by fruit: Fruit, count: Int) {
        if let currentFruitQuantity = fruitsStock[fruit] {
            fruitsStock.updateValue(currentFruitQuantity - count, forKey: fruit)
        }
    }
    
    func bringFruitsStock() -> [String] {
        var fruitsStock = [String]()
        let fruits = Fruit.allCases
        for index in .zero..<self.fruitsStock.count {
            if let fruitStockValue = self.fruitsStock[fruits[index]] { fruitsStock.append(String(fruitStockValue)) }
        }
        return fruitsStock
    }
    
    func bringStockValue(for fruit: Fruit) -> String {
        guard let fruitStock = fruitsStock[fruit] else { return "" }
        return "\(fruitStock)"
    }
    
    func updateStock(_ fruitsStock: [String]) {
        let fruits = Fruit.allCases
        for index in .zero..<self.fruitsStock.count {
            self.fruitsStock[fruits[index]] = Int(fruitsStock[index])
        }
    }
}
