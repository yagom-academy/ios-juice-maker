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
                                                ObjectIdentifier(Kiwi.self): 10, ObjectIdentifier(Pineapple.self): 10
                                                , ObjectIdentifier(Mango.self): 10]

    private init() {
    }
    
    func addFruit(fruit: ObjectIdentifier, amount: Int) {
        if var fruitAvailable = self.fruitsStock[fruit] {
            fruitAvailable += amount
            self.fruitsStock[fruit] = fruitAvailable
        } else {
            self.fruitsStock[fruit] = self.fruitsStock[fruit]
        }
    }
    
    func reduceFruit(fruit: ObjectIdentifier, amount: Int) {
        if var fruitAvailable = self.fruitsStock[fruit] {
            fruitAvailable -= amount
            self.fruitsStock[fruit] = fruitAvailable
        } else {
            self.fruitsStock[fruit] = self.fruitsStock[fruit]
        }
    }
}
