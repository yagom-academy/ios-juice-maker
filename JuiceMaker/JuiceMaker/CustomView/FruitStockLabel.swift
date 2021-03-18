//
//  JuiceLabel.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import UIKit

final class FruitStockLabel: UILabel {
    private(set) var kindFruit: Fruits?
    private(set) var amount: Int?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.backgroundColor = .init(gray: 0.8, alpha: 0.6)
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.adjustsFontSizeToFitWidth = true
    }
    
    func manage(fruit: Fruits, amount: Int) {
        self.kindFruit = fruit
        self.amount = amount
    }
}
