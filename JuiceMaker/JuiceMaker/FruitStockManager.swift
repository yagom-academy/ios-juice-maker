//
//  FruitStock.swift
//  JuiceMaker
//
//  Created by Seungjin Baek on 2021/03/12.
//

import Foundation


class FruitStockManager {
    private(set) var fruitStockAmounts: [String:Int] = [:]
    private(set) var fruitTypes: [String] = ["strawberry", "banana", "pineapple", "kiwi", "mango"]
    
    init() {
        initializeFruitStockAmount(with: 10)
    }
    
    func initializeFruitStockAmount(with baseFruitAmount: Int) {
        for fruitType in fruitTypes {
            fruitStockAmounts[fruitType] = baseFruitAmount
        }
    }
    
    func increaseStockAmount(of fruitType: String, by fruitNumber: Int) {
        if let fruitTypeStockAmount = fruitStockAmounts[fruitType] {
            fruitStockAmounts[fruitType] = fruitTypeStockAmount + fruitNumber
        }
    }
    
    func decreaseStockAmount(of fruitType: String, by fruitNumber: Int) {
        if let fruitTypeStockAmount = fruitStockAmounts[fruitType] {
            fruitStockAmounts[fruitType] = fruitTypeStockAmount - fruitNumber
        }
    }
    
    func isMoreThanOne(fruitType: String) -> Bool {
        guard let fruitTypeStockAmount = fruitStockAmounts[fruitType] else { return false }
        if fruitTypeStockAmount > 0 {
            return true
        }
        return false
    }
    
    func add(fruitType: String) {
        fruitTypes.append(fruitType)
    }
}
