//
//  StockStorage.swift
//  JuiceMaker
//
//  Created by Wonbi on 2022/09/09.
//

import Foundation

class StockStorage {
    static let shared: StockStorage = StockStorage()
     var stock: [Int]?
    
    private init() {}
}
