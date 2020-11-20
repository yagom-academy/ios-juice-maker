//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

class Fruit {
    let name: String
    private var variationOfStockAmount: Int {
        willSet(newValue) {
            self.currentStock += newValue
        }
    }
    private var currentStock: Int
    
    init(name: String) {
        self.name = name
        self.variationOfStockAmount = 0
        currentStock = 0
    }
    
    func showCurrentStock(to: JuiceMaker) -> Int {
        return self.currentStock
    }
    
    func updateStockAmount(reducing value: Int) {
        self.variationOfStockAmount = -value
    }
    
    func updateStockAmount(adding value: Int) {
        guard value > 0 else {
            print("재고추가는 1개 이상 가능합니다.")
            return
        }
        
        self.variationOfStockAmount = value
    }
}
