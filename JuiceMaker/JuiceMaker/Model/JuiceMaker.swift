//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved

import Foundation

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        do {
            _ = try fruitStore.makeReady(for: juice)
            subtractFruitQuantity(for: juice)
            print("주문하신 \(juice)가 나왔어용~")
        } catch (let fruit) {
            print("\(fruit)의 재고가 불충분합니다.")
        }
    }
    
    private func subtractFruitQuantity(for juice: Juice) {
        juice.recipe.forEach { (fruit: Juice.Fruit, count: Int) in
            fruitStore.changeFruitQuantity(by: fruit, count: count)
        }
    }
}
