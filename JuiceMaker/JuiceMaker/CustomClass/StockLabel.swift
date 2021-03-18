//
//  StockLabel.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/18.
//

import UIKit

class StockLabel: UILabel {
    var fruit: Fruit?
    
    static func update(labels: [UILabel], by stock: Stock) {
        for index in 0..<labels.count {
            guard let fruitType = Fruit(rawValue: index) else { return }
            guard let fruitStock = stock.fruits[fruitType] else { return }
            
            labels[index].text = String(fruitStock)
        }
    }
}
