//
//  StockLabel.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/06/15.
//

import UIKit

class StockLabel: UILabel {
    static func update(numbers: [UILabel], of stock: FruitStore) throws {
        for fruit in 0...numbers.count {
            guard let fruits = FruitStore.Fruit(rawValue: fruit), let fruitStock = stock.fruits[fruits] else {
                return
            }
            numbers[fruit].text = String(fruitStock)
        }
    }
}
