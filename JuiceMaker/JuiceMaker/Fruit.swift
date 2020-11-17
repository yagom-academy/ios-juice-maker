//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

struct Fruit {
    var name: String
    var tempCurrentStock: Int
    var currentStock: Int {
        get {
            return tempCurrentStock
        }
    }
    
    init(name: String) {
        self.name = name
        self.tempCurrentStock = 10
    }
    
    func showCurrentStock() -> Int {
        return self.currentStock
    }
    
    mutating func changeStockAmount(reducing amount: Int) {
        self.tempCurrentStock -= amount
    }

    mutating func addStockAmount(adding amount: Int) {
        guard amount > 0 else {
            print("재고추가는 1개 이상 가능합니다.")
            return
        }
        
        self.tempCurrentStock += amount
    }
}
