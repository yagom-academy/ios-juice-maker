//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

struct Fruit {
    var name: String
    private var currentStock: Int
    
    init(name: String) {
        self.name = name
        self.currentStock = 10
        
    }
    
    func showCurrentStock() -> Int {
        return self.currentStock
    }
    
    mutating func changeStockAmount(reducing amount: Int) {
        self.currentStock -= amount
    }

    mutating func addStockAmount(adding amount: Int) {
        guard amount > 0 else {
            print("재고추가는 1개 이상 가능합니다.")
            return
        }
        
        self.currentStock += amount
    }
}
