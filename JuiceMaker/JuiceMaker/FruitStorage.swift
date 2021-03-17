//
//  FruitStorage.swift
//  JuiceMaker
//
//  Created by 김민성 on 2021/03/17.
//

import Foundation

typealias stock = [ObjectIdentifier : Int]

class FruitsStorage {
    static let sharedInstance = FruitsStorage()
    private(set) var fruitsStock: stock = [ObjectIdentifier(Banana.self): 10, ObjectIdentifier(Strawberry.self): 10,
                                           ObjectIdentifier(Kiwi.self): 10, ObjectIdentifier(Pineapple.self): 10,
                                           ObjectIdentifier(Mango.self): 10]

    private init() {
    }
    
    func addFruit(_ fruit: stock.Key, amount: Int) {
        if let remainedFruitStock = self.fruitsStock[fruit] {
            self.fruitsStock[fruit] = remainedFruitStock + amount
        }
    }
    
    func reduceFruit(_ fruit: stock.Key, amount: Int) {
        if let remainedFruitStock = self.fruitsStock[fruit] {
            self.fruitsStock[fruit] = remainedFruitStock - amount
        }
    }
}
