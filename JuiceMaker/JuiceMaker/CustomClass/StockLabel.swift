//
//  StockLabel.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/18.
//

import UIKit

class StockLabel: UILabel {
    var fruit: Fruit?
    
    static func update(labels: [UILabel], by stock: Stock) throws {
        for index in 0..<labels.count {
            guard let fruitType = Fruit(rawValue: index) else { throw StockLabelError.invalidSelection }
            guard let fruitStock = stock.fruits[fruitType] else { throw StockLabelError.invalidSelection }
            
            labels[index].text = String(fruitStock)
        }
    }
}
