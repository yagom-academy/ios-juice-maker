//
//  StockDelegate.swift
//  JuiceMaker
//
//  Created by Wonbi on 2022/09/08.
//

class StockStorage {
    static let shared: StockStorage = StockStorage()
     var stock: [Int]?
    
    private init() {}
}
