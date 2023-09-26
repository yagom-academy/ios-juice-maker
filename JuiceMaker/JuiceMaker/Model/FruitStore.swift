//
//  JuiceMaker - FruitStore.swift
//  Created by hisop, morgan on 2023/09/13.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private(set) var fruitList = [Fruit: Int]()
        
    func modifyStock(modifyList: [Fruit: Int]) {
        for (fruit, stock) in modifyList {
            fruitList[fruit] = stock
        }
        NotificationCenter.default.post(name: Notification.Name(OccurNotification.refreshStock.rawValue), object: nil)
        print("noti도 전달")
    }
    
    func reduceStock(fruit: Fruit, quantity: Int) {
        guard let stock = fruitList[fruit] else {
            return
        }
        
        fruitList[fruit] = stock - quantity
    }
    
    func checkIngredientStock(recipe: [Fruit: Int]) -> Bool {
        for (fruit, quantity) in recipe {
            guard let stock = fruitList[fruit] else {
                return false
            }
            
            guard stock >= quantity else {
                return false
            }
        }
        return true
    }
    
    init(stock: Int) {
        fruitList[.strawberry] = stock
        fruitList[.banana] = stock
        fruitList[.pineapple] = stock
        fruitList[.kiwi] = stock
        fruitList[.mango] = stock
    }
}

