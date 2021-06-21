//
//  StockLabel.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/06/15.
//

import UIKit

class StockLabel: UILabel {
    static func update(numbers: [StockLabel], of stock: FruitStore) {
        for fruit in 0...numbers.count {
            guard let fruitKinds = FruitStore.Fruit(rawValue: fruit), let fruitStock = stock.fruits[fruitKinds] else {
                return
            }
            numbers[fruit].text = String(fruitStock)
        }
    }
}
