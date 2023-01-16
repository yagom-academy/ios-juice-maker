//  JuiceMaker - FruitStore.swift
//  Created by 송준, Rowan. 
//  Copyright © yagom academy. All rights reserved.

class FruitStore {
    static let shared = FruitStore()
    
    var fruitsStock = [Fruits: Int]()
    
    private func fillFruitsStock() {
        for fruit in Fruits.allCases {
            fruitsStock[fruit] = 10
        }
    }
    
    func subtractStock(of fruit: Fruits, count number: Int) {
        if let selectedStock = fruitsStock[fruit] {
            fruitsStock[fruit] = selectedStock - number
        }
    }
    
    func addStock(of fruit: Fruits, count number: Int) {
        if let selectedStock = fruitsStock[fruit] {
            fruitsStock[fruit] = selectedStock + number
        }
    }
    
    func isEnoughStock(of fruit: Fruits, count number: Int) -> Bool {
        guard let selectedStock = fruitsStock[fruit],
              selectedStock - number >= 0 else {
            return false
        }
        return true
    }
    
    private init() {
        self.fillFruitsStock()
    }
}

