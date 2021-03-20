//
//  JuiceLabel.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import UIKit

final class FruitStockLabel: UILabel {
    private var fruitAmount: Int?
    private(set) var kindFruit: Fruits?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.backgroundColor = .init(gray: 0.8, alpha: 0.6)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.adjustsFontSizeToFitWidth = true
    }
    
    func initValue(fruit: Fruits, amount: Int?) {
        guard let amount = amount else {
            return
        }
        self.kindFruit = fruit
        self.fruitAmount = amount
        self.text = String(amount)
    }
    
    func updateLabel(kindFruit: Fruits, fruitAmount: Int?) {
        guard let amount = fruitAmount else {
            return
        }
        self.text = String(amount)
    }
}
