//
//  JuiceMaker - FruitStore.swift
//  Created by 릴라, 세홍, 무리
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    private(set) var fruits: [Fruit: Int] = [:]
    static let shared = FruitStore()
    
    let notificationCenter = NotificationCenter.default
    
    private init() {
        initializeDefaultStock()
    }
    
    private func initializeDefaultStock() {
        let defaultStock = 10
        for fruit in Fruit.allCases {
            fruits[fruit] = defaultStock
        }
    }
    
    func checkStock(forRecipe recipe: [Fruit: Int]) -> Result<Bool, JuiceMakeError> {
        for fruit in Fruit.allCases {
            guard let stock = fruits[fruit],
                  let ingredient = recipe[fruit] else { continue }
            guard stock - ingredient >= 0 else {
                return .failure(.outOfStock)
            }
        }
        return .success(true)
    }
    
    func useFruit(forRecipe recipe: [Fruit: Int]) {
        for fruit in Fruit.allCases {
            guard let stock = fruits[fruit],
                  let ingredient = recipe[fruit] else { continue }
            let remain = stock - ingredient
            fruits[fruit] = remain
            notificationCenter.post(name: .useFruitEvent, object: nil)
        }
    }
    
    func checkRemainStock() {
        for fruit in Fruit.allCases {
            guard let stock = fruits[fruit] else { return }
            print("\(fruit.rawValue)이(가) \(stock)개 남았습니다.")
        }
    }
}
