//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private(set) var stockOfFruit: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            stockOfFruit[fruit] = Fruit.initialValue
        }
        addObserverForStockUpdate()
    }
    
    private func postNotification(for fruit: Fruit, stock: Int, succeed: Bool) {
        notificationCenter.post(name: Notification.Name.stockInformation,
                                object: nil,
                                userInfo: [NotificationKey.fruit: fruit,
                                           NotificationKey.stock: stock,
                                           NotificationKey.orderComplete: succeed])
    }
    
    private func addObserverForStockUpdate() {
        notificationCenter.addObserver(self,
                                       selector: #selector(didReceiveUpdateNotification),
                                       name: Notification.Name.stockModified,
                                       object: nil)
    }
    
    @objc private func didReceiveUpdateNotification(_ notification: Notification) {
        let userInfo = notification.userInfo
        
        if let stockOfFruit = userInfo?[NotificationKey.stockOfFruit] as? [Fruit: Int] {
            self.stockOfFruit = stockOfFruit
        }
    }
    
    private func hasEnoughStock(of fruit: Fruit, amount: Int) -> Bool {
        if let fruitAmount = stockOfFruit[fruit], fruitAmount >= amount {
            return true
        } else {
            postNotification(for: fruit, stock: amount, succeed: false)
            return false
        }
    }
    
    private func subtractStock(of fruit: Fruit, amount: Int) {
        if let stock = stockOfFruit[fruit] {
            stockOfFruit[fruit] = stock - amount
            postNotification(for: fruit, stock: stock - amount, succeed: true)
        }
    }
    
    func consumeFruits(firstFruit: Fruit, firstFruitAmount: Int, secondFruit: Fruit? = nil, secondFruitAmount: Int? = nil) {
        guard hasEnoughStock(of: firstFruit, amount: firstFruitAmount) else {
            return
        }
        guard let secondFruit = secondFruit,
              let secondFruitAmount = secondFruitAmount else {
                  subtractStock(of: firstFruit, amount: firstFruitAmount)
                  return
              }
        guard hasEnoughStock(of: secondFruit, amount: secondFruitAmount) else {
            return
        }
        subtractStock(of: firstFruit, amount: firstFruitAmount)
        subtractStock(of: secondFruit, amount: secondFruitAmount)
    }
}
