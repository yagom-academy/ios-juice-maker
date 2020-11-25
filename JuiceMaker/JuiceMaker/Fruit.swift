//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

class Fruit {
    let name: String
    let productNumber: Int
    private var variationOfStockAmount: Int {
        willSet(newValue) {
            self.stock += newValue
        }
    }
    private var stock: Int
    
    init(name: String, productNumber: Int) {
        self.name = name
        self.productNumber = productNumber
        self.variationOfStockAmount = 0
        stock = 0
    }
    
    func stockAmount() -> Int {
        return self.stock
    }
    
    func updateStockAmount(reducing value: Int) {
        guard stock - value >= 0 else {
            return
        }
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
